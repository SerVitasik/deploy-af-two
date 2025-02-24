variable "REGISTRY_BASE" {
  default = "appserver.local:5000"
}

group "default" {
  targets = ["deploy-af-two"]
}

target "deploy-af-two" {
  context = ".."
  tags = ["${REGISTRY_BASE}/deploy-af-two:latest"]
  cache-from = ["type=registry,ref=${REGISTRY_BASE}/deploy-af-two:cache"]
  cache-to   = ["type=registry,ref=${REGISTRY_BASE}/deploy-af-two:cache,mode=max,compression=zstd"]
  push = true
}