# Build Docker Images

- Each image has its own Dockerfile.

### Build AbC image
```docker build -f Dockerfile -t qms_6.3:AbC .```

### Build def image
```docker build -f Dockerfile2 -t qms_6.3:def .```

### Build latest image
```docker build -f Dockerfile3 -t qms_6.3:latest .```

# Note

- Because we explicitly specify the tag using -t, Docker will NOT rename it to latest.
### The final image names will be:

- qms_6.3:AbC

- qms_6.3:def

- qms_6.3:latest

# Run Containers (CPU Mode)

Use these commands if GPU is not required.

### Run latest
```docker run -d --name latest -p 8559:8559 -p 8879:8879 -p 8554:8554 -p 8888:8888 -p 8000:8000 qms_6.3:latest```

### Run def
```docker run -d --name def -p 8555:8555 -p 8889:8889 -p 8554:8554 -p 8888:8888 -p 8000:8000 qms_6.3:def```

### Run AbC
```docker run -d --name AbC -p 8554:8554 -p 8888:8888 -p 8000:8000 qms_6.3:AbC```

## Run Containers (GPU Mode)

- GPU support is enabled only at runtime, using the --gpus flag.

- No ENV variable is required in the Dockerfile to enable GPU.

### Run latest with GPU device 0
```docker run -d --name latest --gpus '"device=0"' -p 8559:8559 -p 8879:8879 -p 8554:8554 -p 8888:8888 -p 8000:8000 qms_6.3:latest```

### Run def with GPU device 1
```docker run -d --name def --gpus '"device=1"' -p 8555:8555 -p 8889:8889 -p 8554:8554 -p 8888:8888 -p 8000:8000 qms_6.3:def```
### Run AbC with GPU device 2
```docker run -d --name AbC --gpus '"device=2"' -p 8554:8554 -p 8888:8888 -p 8000:8000 qms_6.3:AbC```

# Run the monitor bash script to monitor the Containers

``` bash monitor.sh  ``` or 
```/bin/bash monitor.sh```

