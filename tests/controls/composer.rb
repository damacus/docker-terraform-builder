# encoding: utf-8
# copyright: 2017, DeBankeGroup

title 'Terraform Command'

control 'terraform-commands' do
  impact 1
  title 'terraform'
  desc 'Should respond to the version subcommand'
  describe command('terraform version') do
    its('exit_status') { should match 0 }
    its('stdout') { should match /Terraform v0.11/ }
    its('stdout') { should_not match /Your version of Terraform is out of date/}
  end

  describe command('git') do
    its('stdout') { should match /These are common Git commands used in various situations/ }
  end

  describe command('curl --version') do
    its('stdout') { should match /curl/ }
  end
end
