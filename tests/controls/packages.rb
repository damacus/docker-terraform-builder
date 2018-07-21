# encoding: utf-8

title 'Available Packages'

control 'packages' do
  impact 1
  title 'available packages'
  desc 'Prerequisite packages should be installed by our base image'
  describe package('git') do
    its('statuses') { should cmp 'installed' }
  end

  describe package('sudo') do
    its('statuses') { should_not cmp 'installed' }
  end

  describe package('curl') do
    its('statuses') { should cmp 'installed' }
  end

  describe os.family do
    it { should eq 'linux' }
  end

  describe os.name do
    it { should eq 'alpine' }
  end
end
