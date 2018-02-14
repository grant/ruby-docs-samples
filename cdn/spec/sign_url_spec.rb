# Copyright 2018 Google, Inc
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

require_relative "../sign_url"
require "rspec"

describe "Google Cloud CDN signed url" do
  it "Signs a test URL" do
    expect {
      signed_url url:        "http://www.example.com/",
                 key_name:   "my-key",
                 key:        "nZtRohdNF9m3cKM24IcK4w==",
                 expiration: "Nov 6 00:00:00 GMT 2021"
    }.to output(
      /http:\/\/www\.example\.com\/\?Expires=1636156800&KeyName=my-key&Signature=fHM540uiAcrzc7yw3W3Ci0FUtsw=/
    ).to_stdout
  end
end
