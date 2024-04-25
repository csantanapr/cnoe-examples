# CNOE.io Examples

Examples to showcase use cases for Internal Developer Platform on top of Kubernetes

### Using DevPod
- Install and open [DevPod](https://devpod.sh)
- Setup a Cloud Provider (ie. AWS)
- Open Workspace at https://github.com/csantanapr/cnoe-examples, select a cloud provider VM and Visual Studio Desktop as IDE
- In Visual Studio Code on the Desktop open the "PORTS" tab, then add a new forward rule for port `8443` to `127.0.0.1:8443` this will make a tunnel using ssh from Visual Studio Code on Desktop to the remote Linux VM.

### Examples

[Standardization vs. Autonomy the Platform Engineering Balance](./examples/devopsdays2024/README.md)


