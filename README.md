![Build Docker Image workflow](https://github.com/robinostlund/docker-miner-trex/actions/workflows/docker-build.yml/badge.svg)

# T-Rex NVIDIA GPU miner (Ethash / Kawpow / Octopus / MTP)
Original repository: https://github.com/trexminer/T-Rex
Requires nvidia runtime installed on your docker host

## CUDA Version
To be able to see which cuda version you are running, run `nvidia-smi`:

```
nvidia-smi
Sat May  1 20:19:02 2021
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 460.73.01    Driver Version: 460.73.01    CUDA Version: 11.2     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  GeForce GTX 166...  On   | 00000000:01:00.0 Off |                  N/A |
| 70%   70C    P2    79W /  80W |   4392MiB /  5944MiB |    100%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|    0   N/A  N/A      5157      G   /usr/lib/xorg/Xorg                  6MiB |
|    0   N/A  N/A   2720215      C   /usr/local/bin/t-rex             4381MiB |
+-----------------------------------------------------------------------------+
```

## Test
```sh
docker pull robostlund/miner-trex-cuda:latest-cuda-11.2.1
docker run -it --runtime=nvidia --rm robostlund/miner-trex-cuda:latest-cuda-11.2.1 t-rex --help
```

## Start
```sh
docker pull robostlund/miner-trex-cuda:latest-cuda-11.2.1
docker run -dt \
    --runtime nvidia \
    --name trex \
    --publish 4067:4067/tcp \
    --env ALGO="ethash" \
    --env SERVER="stratum+tcp://eu1.ethermine.org:4444" \
    --env USERNAME="0xD0469ac9d8935EBffb706EDc9D45a9c522d04f13" \
    --env PASSWORD="x" \
    --env WORKER_NAME="myworker" \
    --env EXTRA_ARGS=""
    robostlund/miner-trex-cuda:latest_cuda11.2.0
```

## OC Settings
### GTX 1660 Super (Hynix Memory)
Config: 
```sh
nvidia-smi -pm 1
nvidia-smi -i 0 -pl 80
nvidia-settings -a [gpu:0]/GPUPowerMizerMode=1
nvidia-settings -a [gpu:0]/GPUFanControlState=1
nvidia-settings -a [fan:0]/GPUTargetFanSpeed=70
nvidia-settings -a [gpu:0]/GPUGraphicsClockOffsetAllPerformanceLevels=-200
nvidia-settings -a [gpu:0]/GPUMemoryTransferRateOffsetAllPerformanceLevels=-1004
```
Result: GPU #0: Gigabyte GTX 1660 SUPER - 31.83 MH/s, [T:69C, P:79W, F:70%, E:403kH/W], 2/2 R:0%