# EXAMPLE for PowerEvents PowerShell module available on http://powerevents.codeplex.com
#
#  Author: Trevor Sullivan
#    Date: 11/28/10
#   Brief: This example shows how to use PowerEvents to create a WMI event consumer that runs a command line in response to a user profile being unloaded.
#    Note: This is not a complete working sample of the PowerEvents module. This only shows how to create an event consumer.
#          A fully functioning sample requires an event filter, to define the events, as well as a binding between the filter and consumer.

New-WmiEventConsumer -Name UserProfileUnloaded-DeleteUnusedProfiles -ConsumerType CommandLine -CommandLineTemplate "powershell.exe -command `"Get-WmiObject -Namespace root\cimv2 -Class Win32_UserProfile -Filter `"Special = 'false' and Loaded = 'false'`" | % { $_.Delete() }`""