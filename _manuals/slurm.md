---
layout: manual
title:  "slurm"
---

Usage of the slurm workload manager.

See http://slurm.schedmd.com/slurm.html

---

* TOC
{:toc}

---

## information

```bash
# show queues, and update every *N*th second
smap -i N
squeue -i N

# queue details
squeue -j ID[,ID,...] # per job
       -p NAME        # per partition
       -l             # increase output

# tabular info
sinfo -i N            # as in squeue
      -p NAME 
      -l

# list info
scontrol show -d                    # more details
              job|node|partition ID
```

## control

```bash
# stop jobs
scancel -t PENDING|RUNNING|SUSPENDED # by state
        -n NAME                      # by job name
        -p NAME                      # by partition name
        -w node[1-5,7]               # by hostname

# modify
scontrol suspend|resume|hold ID
```

## submit

```bash
sbatch -J NAME              # jobname
       -p PARTITION[,...]   # partition
       -n N                 # number of tasks
       -c N                 # number of cpus per task
       -N N                 # number of hosts
       -w HOST[,...]        # host list
       -d afterok:ID[,...]  # dependency
       -t HH:MMSS           # runtime
       -o STDOUT            # stdout (and stderr if not specified)
       -e STDERR            # stderr
       --mem MB             # memory
       -a 0-N[%M]           # number of array jobs [at a time]
                            # %j = job ID
                            # %A = array ID
                            # %a = array index
```

