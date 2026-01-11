docker run -p 8501:8501 ^
  --name kubernetes-app-container ^
  --security-opt seccomp=unconfined ^
  kubernetes-app