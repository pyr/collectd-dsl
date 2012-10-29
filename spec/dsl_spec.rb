require 'spec_helper'

describe Collectd::DSL do
  context "simple options" do
    it "no args given" do
      config = Collectd::DSL.parse do
        load_plugin :disk
      end
      config.should == "LoadPlugin disk\n"
    end
    it "one arg given" do
      config = Collectd::DSL.parse do
        load_plugin :disk, '/dev/sda'
      end
      config.should == "LoadPlugin disk \"/dev/sda\"\n"
    end
    it "section" do
      config = Collectd::DSL.parse do
        plugin :disk do
          disk '/dev/sda'
        end
      end
      config.should == "<Plugin disk>\n\tDisk \"/dev/sda\"\n</Plugin>\n"
    end
    it "section with no args" do
      config = Collectd::DSL.parse do
        plugin do
          disk '/dev/sda'
        end
      end
      config.should == "<Plugin>\n\tDisk \"/dev/sda\"\n</Plugin>\n"
    end
    it "empty section" do
      config = Collectd::DSL.parse do
        plugin do
        end
      end
      config.should == "<Plugin>\n</Plugin>\n"

    end
  end
end
