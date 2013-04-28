require 'full_tang/core_ext/hash'
require 'timecop'

describe Hash do
  before(:each) do
    @hash = {
      a_string: "I'm a string",
      a_number: 42,
      a_boolean: false,
      a_proc: -> { Time.now.to_s }
    }
  end

  describe '#call_procs' do
    subject { @hash.call_procs }

    it { should be_a Hash }
    it { should_not eq @hash }

    it "should evaluate the Proc" do
      new_hash = @hash.call_procs
      @hash[:a_proc].should be_a Proc
      new_hash[:a_proc].should be_a String
    end

    it "should call the Proc" do
      Timecop.freeze
      new_hash = @hash.call_procs
      @hash.each do |key, value|
        if value.is_a? Proc
          @hash[key].call.should eq new_hash[key]
        end
      end
      Timecop.return
    end

    it "should not change values that are not Procs" do
      new_hash = @hash.call_procs
      @hash.each do |key, value|
        unless value.is_a? Proc
          @hash[key].should eq new_hash[key]
        end
      end
    end
  end

  describe '#call_procs!' do
    before(:each) do
      Timecop.freeze
      @old_hash = @hash.dup
    end

    after  { Timecop.return }

    subject { @hash.call_procs! }

    it { should be_a Hash }
    it { should_not eq @old_hash }
    it { should eq @old_hash.call_procs }
  end

  describe '#symbolize_keys!' do
    before(:each) do
      @string_keyed_hash = {
        "chef" => "is awesome",
        "hashes" => "are really useful",
        :imasymbol => "Woah, were'd that come from"
      }
      @old_hash = @string_keyed_hash.dup
    end

    subject { @string_keyed_hash.symbolize_keys! }
    it { should be_a Hash }
    it { should_not eq @old_hash }

    it "should convert string keys to symbols" do
      @string_keyed_hash.symbolize_keys!
      @old_hash.each do |key, value|
        key.to_sym.should eq @string_keyed_hash.key(value)
      end
    end

    describe 'with keys other than strings/symbols' do
      before(:each) do
        object_as_key_hash = { 1 => "Now we're just being silly. Who does this?" }
        @string_keyed_hash.merge object_as_key_hash
        @old_hash.merge object_as_key_hash
        @string_keyed_hash.symbolize_keys!
      end

      it "should handle it gracefully" do
        @old_hash.each do |key, value|
          @string_keyed_hash.key(value).should be_a Fixnum if key.is_a? Fixnum
        end
      end
    end
  end
end
