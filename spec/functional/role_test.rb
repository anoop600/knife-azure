#
# Copyright:: Copyright (c) Chef Software Inc.
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

require_relative "../spec_helper"

describe "roles" do
  before(:all) do
    @connection = Azure::Connection.new(TEST_PARAMS)
    @roles = @connection.roles.all
  end

  specify { @connection.roles.exists?("notexist").should == false }
  specify { @connection.roles.exists?("role126").should == true }
  it "run through roles" do
    @connection.roles.roles.each do |role|
      role.name.should_not be_nil
    end
  end
end
