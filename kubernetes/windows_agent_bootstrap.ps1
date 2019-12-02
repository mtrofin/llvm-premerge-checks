# Copyright 2019 Google LLC

# Licensed under the the Apache License v2.0 with LLVM Exceptions (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     https://llvm.org/LICENSE.txt

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# TODO: check if machine has an SSD
# TODO: only do this, if SSD is not yet usable
Write-Host "Initializing local SSD..."
Initialize-Disk -Number 0
New-Partition -DiskNumber 0 -UseMaximumSize -AssignDriveLetter
Format-Volume -DriveLetter D

Write-Host "Authenticating with gcloud..."
docker-credential-gcr configure-docker

Write-Host "Launching docker container, this might take a while..."
docker run gcr.io/llvm-premerge-checks/agent-windows-jenkins:latest -v d:\:c:\ws