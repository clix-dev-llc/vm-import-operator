# Copyright 2018-2019 Red Hat, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export KUBEVIRT_PROVIDER=${KUBEVIRT_PROVIDER:-'k8s-1.16.2'}

KUBEVIRTCI_VERSION='9b8707c02d59ee1a7924103b6beca9b9cd010633'
KUBEVIRTCI_PATH="${PWD}/_kubevirtci"

function kubevirtci::install() {
    if [ ! -d ${KUBEVIRTCI_PATH} ]; then
        git clone https://github.com/kubevirt/kubevirtci.git ${KUBEVIRTCI_PATH}
        (
            cd ${KUBEVIRTCI_PATH}
            git checkout ${KUBEVIRTCI_VERSION}
        )
    fi
}

function kubevirtci::path() {
    echo -n ${KUBEVIRTCI_PATH}
}

function kubevirtci::kubeconfig() {
    echo -n ${KUBEVIRTCI_PATH}/_ci-configs/${KUBEVIRT_PROVIDER}/.kubeconfig
}