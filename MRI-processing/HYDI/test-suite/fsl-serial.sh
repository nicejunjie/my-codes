#!/bin/bash -l


module load matlab/2016a
module load fsl 
module load gnu-parallel

workdir=`pwd`

for i in `echo Input*`
do 

  cd $i  #go to the input folder

  cd RAW_DATA
  dcm2nii -4 y -a y -g n -n y -p y -v y *.dcm
  mv *.nii DWI.nii 
  mv *.bval DWI.bval
  mv *.bvec DWI.bvec
  cd ../

# delete denoise folder if it already exist
  if [ -d denoise ]; then 
      rm -r denoise
  fi

# copy raw data to denoise folder
  mkdir denoise
  cp $workdir/matlab_code/DWIDenoisingPackage_r01_pcode/f_run_LPCA.m denoise/
  cp RAW_DATA/DWI.* denoise/
  cp $workdir/matlab_denoise.m denoise/

# calling matlab for denoise
  cd denoise/
  matlab -nodisplay -nodesktop -r "run matlab_denoise.m"
  cd ../

  cd FM_DATA
  dcm2nii -4 y -a y -g n -n y -p y -v y *.dcm 
  mv *.nii b0_no_rp.nii 
  cd ../

# delete fieldmap folder if it already exist
  if [ -d fieldmap ]; then 
      rm -r fieldmap
  fi
  mkdir fieldmap 

# copy denoised data into fieldmap folder
  cp $workdir/matlab_code/my_acq_param.txt fieldmap/
  cp $workdir/matlab_code/index.txt fieldmap/
  cp denoise/* FM_DATA/* fieldmap/

#  setup forward phase
  cd fieldmap
  fslsplit DWI_d.nii
  mv vol0000.nii.gz b0_no_fp.nii.gz
  rm vol*

#        CHANGING SLICE NUMBER FOR TOPUP and TOPUP
  fslroi b0_no_rp.nii b0_no_rp_60s.nii.gz 0 120 0 120 0 4
  fslroi b0_no_fp.nii.gz b0_no_fp_60s.nii.gz 0 120 0 120 0 4
  fslroi DWI_d.nii DWI_d_60s.nii.gz 0 120 0 120 0 4
 
  fslmerge -t combine_AP_PA.nii.gz b0_no_rp_60s.nii.gz b0_no_fp_60s.nii.gz
  topup --imain=combine_AP_PA.nii.gz --datain=my_acq_param.txt --config=b02b0.cnf --out=my_topup_results --iout=corrected_b0_AP_PA.nii.gz
  fslmaths corrected_b0_AP_PA.nii.gz -Tmean corrected_b0_AP_PA_Tm.nii.gz
  bet corrected_b0_AP_PA_Tm corrected_b0_AP_PA_Tm_brain -f 0.2 -g 0 -n -m 
  eddy_openmp --imain=DWI_d_60s.nii.gz --mask=corrected_b0_AP_PA_Tm_brain_mask.nii.gz --acqp=my_acq_param.txt --index=index.txt --bvecs=DWI.bvec --bvals=DWI.bval --topup=my_topup_results --out=eddy_corrected_data --data_is_shelled

  cd $workdir
done 
