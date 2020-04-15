#
# Author:: Adam Jacob (<adam@chef.io>)
# Copyright:: Copyright 2010-2020, Chef Software Inc.
# License:: Apache License, Version 2.0
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
#

require_relative "helpers/azurerm_base"

class Chef
  class Knife
    class AzurermServerList < Knife

      include Knife::AzurermBase

      banner "knife azurerm server list (options)"

      deps do
        include Knife::AzurermBase
      end

      def run
        $stdout.sync = true
        # check azure cli version due to azure changed `azure` to `az` in azure-cli2.0
        get_azure_cli_version
        validate_arm_keys!
        begin
          service.list_servers(config[:azure_resource_group_name])
        rescue => error
          service.common_arm_rescue_block(error)
        end
      end
    end
  end
end
