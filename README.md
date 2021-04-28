![Build Docker Image workflow](https://github.com/robinostlund/docker-miner-trex/actions/workflows/docker-image.yml/badge.svg)

## CUDA Version
To be able to see which cuda version you are running, run `nvidia-smi`:

```
nvidia-smi
Sat Jan  9 12:17:02 2021       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 450.51.06    Driver Version: 450.51.06    CUDA Version: 11.2     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  Tesla M60           Off  | 00000000:00:1E.0 Off |                    0 |
| N/A   49C    P0    73W / 150W |   7618MiB /  7618MiB |    100%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
+-----------------------------------------------------------------------------+
```


## Test
```
nvidia-docker pull robostlund/miner-trex-cuda:v0.20.3_cuda_11.2.0
nvidia-docker run -it --rm robostlund/miner-trex-cuda:v0.20.3_cuda_11.2.0 t-rex --help
```