#! /bin/csh -f
##############################
# Purpose:     Simulate starting a Tempus job.
# Method:      Use LSF blaunch with local procs
# Results:     Success is indicated by hello_world3.txt
##############################
setenv TEMPUS          "xterm -bg orange -fg black"

setenv BSUB            /grid/sfi/farm/bin/bsub
setenv NO_RES_VALIDATION 1                     ; # Specific to the Cadence LSF wrapper

set clientCnt = 2
set threadCnt = 1
setenv maxMem    5000
setenv tmpDisk   2000
setenv logName blaunch_xterm_interactive.log

echo "Client count:  $clientCnt"
setenv clientCnt $clientCnt
setenv threadCnt $threadCnt
echo "Thread count:  $threadCnt"
set machineCnt = `expr $clientCnt + 1 `
echo "Machine count: $machineCnt"
set  procCnt  = `expr $machineCnt \* $threadCnt `
echo "Proc count:    $procCnt"

#################
# Grab one machine and use only procs on that one machine
# -x should be avoided, but this queue requires it
# -P is Cadence specific
# -m is Cadence specific
# -q is customer specific
# -J is optional and used to name the jobs in LSF
#################
bsub -J blaunch_local -P "GEN:main:EX:ES" -x -W 10000 -q ssv" -n 20 -R "rusage[mem=${maxMem}] " $TEMPUS
