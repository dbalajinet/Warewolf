#Requires -RunAsAdministrator
Param(
  [string]$ServerPath,
  [string]$StudioPath,
  [string]$TestsPath,
  [string]$ResourcesType,
  [switch]$StartServer,
  [switch]$StartStudio,
  [switch]$VSTest,
  [switch]$MSTest,
  [switch]$DotCover,
  [string]$MSTestPath="",
  [string]$VSTestPath="",
  [string]$DotCoverPath="$env:LocalAppData\JetBrains\Installations\dotCover08\dotCover.exe",
  [string]$ServerUsername,
  [string]$ServerPassword,
  [string]$JobName="",
  [switch]$RunAllJobs,
  [switch]$Cleanup
)
$JobSpecs = @{}
#CI
$JobSpecs["Other Unit Tests"] 				 	= "Dev2.*.Tests,Warewolf.*.Tests"
$JobSpecs["Other Specs"]		 				= "Dev2.*.Specs,Warewolf.*.Specs", "(TestCategory!=ExampleWorkflowExecution)&(TestCategory!=WorkflowExecution)&(TestCategory!=SubworkflowExecution)"
$JobSpecs["Tools Specs"]		 				= "Warewolf.ToolsSpecs"
$JobSpecs["UI Binding Tests"] 				 	= "Warewolf.UIBindingTests.*"
$JobSpecs["COMIPC Unit Tests"]				 	= "Warewolf.COMIPC.Tests"
$JobSpecs["Example Workflow Execution Specs"] 	= "Dev2.*.Specs,Warewolf.*.Specs", "ExampleWorkflowExecution"
$JobSpecs["Studio View Models Unit Tests"]	 	= "Warewolf.Studio.ViewModels.Tests"
$JobSpecs["Subworkflow Execution Specs"]		= "Dev2.*.Specs,Warewolf.*.Specs", "SubworkflowExecution"
$JobSpecs["Workflow Execution Specs"]		 	= "Dev2.*.Specs,Warewolf.*.Specs", "WorkflowExecution"
$JobSpecs["Activity Designers Unit Tests"]	 	= "Dev2.Activities.Designers.Tests"
$JobSpecs["Activity Unit Tests"]				= "Dev2.Activities.Tests"
$JobSpecs["Integration Tests"]				 	= "Dev2.IntegrationTests"
#Coded UI
$JobSpecs["Other UI Tests"]					    = "Warewolf.UITests", "(TestCategory!=Tools)&(TestCategory!=Data Tools)&(TestCategory!=Database Tools)&(TestCategory!=Dropbox Tools)&(TestCategory!=File Tools)&(TestCategory!=HTTP Tools)&(TestCategory!=Recordset Tools)&(TestCategory!=Sharepoint Tools)&(TestCategory!=Utility Tools)&(TestCategory!=Explorer)&(TestCategory!=Tabs and Panes)&(TestCategory!=Deploy)&(TestCategory!=Debug Input)&(TestCategory!=Workflow Testing)&(TestCategory!=Default Layout)&(TestCategory!=Resource Tools)&(TestCategory!=Save Dialog)&(TestCategory!=Shortcut Keys)&(TestCategory!=Settings)&(TestCategory!=Dependency Graph)&(TestCategory!=Variables)&(TestCategory!=Email Tools)&(TestCategory!=Plugin Sources)&(TestCategory!=Web Sources)&(TestCategory!=Database Sources)&(TestCategory!=Workflow Mocking Tests)&(TestCategory!=Assign Tool)&(TestCategory!=Control Flow Tools)&(TestCategory!=DotNet Connector Mocking Tests)&(TestCategory!=DotNet Connector Tool)&(TestCategory!=Hello World Mocking Tests)&(TestCategory!=Server Sources)&(TestCategory!=Source Wizards)"
$JobSpecs["Other UI Specs"]					    = "Warewolf.UISpecs", "(TestCategory!=DBConnector)&(TestCategory!=PluginConnector)&(TestCategory!=WebConnector)&(TestCategory!=Explorer)&(TestCategory!=Deploy)&(TestCategory!=SaveDialog)"
$JobSpecs["Assign Tool UI Tests"]				= "Warewolf.UITests", "Assign Tool"
$JobSpecs["Control Flow Tools UI Tests"]		= "Warewolf.UITests", "Control Flow Tools"
$JobSpecs["Database Sources UI Tests"]			= "Warewolf.UITests", "Database Sources"
$JobSpecs["Database Tools UI Tests"]			= "Warewolf.UITests", "Database Tools"
$JobSpecs["Data Tools UI Tests"]				= "Warewolf.UITests", "Data Tools"
$JobSpecs["DB Connector UI Specs"]				= "Warewolf.UISpecs", "DBConnector"
$JobSpecs["Debug Input UI Tests"]				= "Warewolf.UITests", "Debug Input"
$JobSpecs["Default Layout UI Tests"]			= "Warewolf.UITests", "Default Layout"
$JobSpecs["Dependency Graph UI Tests"]			= "Warewolf.UITests", "Dependency Graph"
$JobSpecs["Deploy UI Specs"]					= "Warewolf.UISpecs", "Deploy"
$JobSpecs["Deploy UI Tests"]					= "Warewolf.UITests", "Deploy"
$JobSpecs["DotNet Connector Mocking UI Tests"]	= "Warewolf.UITests", "DotNet Connector Mocking Tests"
$JobSpecs["DotNet Connector Tool UI Tests"]	    = "Warewolf.UITests", "DotNet Connector Tool"
$JobSpecs["Dropbox Tools UI Tests"]			    = "Warewolf.UITests", "Dropbox Tools"
$JobSpecs["Email Tools UI Tests"]				= "Warewolf.UITests", "Email Tools"
$JobSpecs["Explorer UI Specs"]					= "Warewolf.UISpecs", "Explorer"
$JobSpecs["Explorer UI Tests"]					= "Warewolf.UITests", "Explorer"
$JobSpecs["File Tools UI Tests"]				= "Warewolf.UITests", "File Tools"
$JobSpecs["Hello World Mocking UI Tests"]		= "Warewolf.UITests", "Hello World Mocking Tests"
$JobSpecs["HTTP Tools UI Tests"]				= "Warewolf.UITests", "HTTP Tools"
$JobSpecs["Plugin Sources UI Tests"]			= "Warewolf.UITests", "Plugin Sources"
$JobSpecs["Recordset Tools UI Tests"]			= "Warewolf.UITests", "Recordset Tools"
$JobSpecs["Resource Tools UI Tests"]			= "Warewolf.UITests", "Resource Tools"
$JobSpecs["Save Dialog UI Specs"]				= "Warewolf.UISpecs", "Save Dialog"
$JobSpecs["Save Dialog UI Tests"]				= "Warewolf.UISpecs", "SaveDialog"
$JobSpecs["Server Sources UI Tests"]			= "Warewolf.UITests", "Server Sources"
$JobSpecs["Settings UI Tests"]					= "Warewolf.UITests", "Settings"
$JobSpecs["Sharepoint Tools UI Tests"]			= "Warewolf.UITests", "Sharepoint Tools"
$JobSpecs["Shortcut Keys UI Tests"]			    = "Warewolf.UITests", "Shortcut Keys"
$JobSpecs["Source Wizards UI Tests"]			= "Warewolf.UITests", "Source Wizards"
$JobSpecs["Tabs And Panes UI Tests"]			= "Warewolf.UITests", "Tabs and Panes"
$JobSpecs["Tools UI Tests"]					    = "Warewolf.UITests", "Tools"
$JobSpecs["Utility Tools UI Tests"]			    = "Warewolf.UITests", "Utility Tools"
$JobSpecs["Variables UI Tests"]				    = "Warewolf.UITests", "Variables"
$JobSpecs["Web Connector UI Specs"]			    = "Warewolf.UISpecs", "WebConnector"
$JobSpecs["Web Sources UI Tests"]				= "Warewolf.UITests", "Web Sources"
$JobSpecs["Workflow Mocking Tests UI Tests"]	= "Warewolf.UITests", "Workflow Mocking Tests"
$JobSpecs["Workflow Testing UI Tests"]			= "Warewolf.UITests", "Workflow Testing"
#Security
$JobSpecs["Conflicting Contribute View And Execute Permissions Security Specs"] = "Warewolf.SecuritySpecs", "ConflictingContributeViewExecutePermissionsSecurity"
$JobSpecs["Conflicting Execute Permissions Security Specs"]					    = "Warewolf.SecuritySpecs", "ConflictingExecutePermissionsSecurity"
$JobSpecs["Conflicting View And Execute Permissions Security Specs"]			= "Warewolf.SecuritySpecs", "ConflictingViewExecutePermissionsSecurity"
$JobSpecs["Conflicting View Permissions Security Specs"]						= "Warewolf.SecuritySpecs", "ConflictingViewPermissionsSecurity"
$JobSpecs["No Conflicting Permissions Security Specs"]							= "Warewolf.SecuritySpecs", "NoConflictingPermissionsSecurity"
$JobSpecs["OverlappingUserGroupsPermissions Security Specs"]					= "Warewolf.SecuritySpecs", "OverlappingUserGroupsPermissionsSecurity"
$JobSpecs["ResourcePermissions Security Specs"]								    = "Warewolf.SecuritySpecs", "ResourcePermissionsSecurity"
$JobSpecs["ServerPermissions Security Specs"]									= "Warewolf.SecuritySpecs", "ServerPermissionsSecurity"

$ServerExeName = "Warewolf Server.exe"
$ServerPathSpecs = @()
$ServerPathSpecs += $ServerExeName
$ServerPathSpecs += "Server\" + $ServerExeName
$ServerPathSpecs += "DebugServer\" + $ServerExeName
$ServerPathSpecs += "ReleaseServer\" + $ServerExeName
$ServerPathSpecs += "Dev2.Server\bin\Debug\" + $ServerExeName
$StudioPathSpecs += "Bin\Server\" + $ServerExeName
$StudioPathSpecs += "Dev2.Server\bin\Release\" + $ServerExeName
$ServerPathSpecs += "*Server.zip"

$StudioExeName = "Warewolf Studio.exe"
$StudioPathSpecs = @()
$StudioPathSpecs += $StudioExeName
$StudioPathSpecs += "Studio\" + $StudioExeName
$StudioPathSpecs += "DebugStudio\" + $StudioExeName
$StudioPathSpecs += "ReleaseStudio\" + $StudioExeName
$StudioPathSpecs += "Dev2.Studio\bin\Debug\" + $StudioExeName
$StudioPathSpecs += "Bin\Studio\" + $StudioExeName
$StudioPathSpecs += "Dev2.Studio\bin\Release\" + $StudioExeName
$StudioPathSpecs += "*Studio.zip"

function FindFile-InParent([string[]]$FileSpecs) {
	$NumberOfParentsSearched = 0
    $NumberOfFileSpecsSearched = 0
    $FilePath = ""
	while ($FilePath -eq "" -and $NumberOfParentsSearched++ -lt 7 -and $CurrentDirectory -ne "") {
        while ($FilePath -eq "" -and $NumberOfFileSpecsSearched++ -lt $FileSpecs.Length) {
            $FileSpec = $FileSpecs[$NumberOfFileSpecsSearched-1]
            if ($FileSpec.Substring(1,$FileSpec.Length-1).StartsWith(":\")) {
		        if (Test-Path "$FileSpec") {
			        $FilePath = $FileSpec
		        }
            } else {
	            $CurrentDirectory = $PSScriptRoot
		        if (Test-Path "$CurrentDirectory\$FileSpec") {
			        $FilePath = "$CurrentDirectory\$FileSpec"
		        }
            }
        }
        if ($CurrentDirectory -ne $null -and $CurrentDirectory -ne "" -and !($CurrentDirectory.EndsWith(":\"))) {
		    if ($FilePath -eq "") {
			    $CurrentDirectory = (Get-Item $CurrentDirectory).Parent.FullName
		    }
        } else {
            $CurrentDirectory = ""
        }
    }
    $FilePath
}

function Cleanup-ServerStudio {
    if ($Args.length > 1) {
        [int]$WaitForCloseTimeout = $Args[0]
    } else {
        [int]$WaitForCloseTimeout = 1800
    }
    if ($Args.length > 1) {
	    [int]$WaitForCloseRetryCount = $Args[1]
    } else {
	    [int]$WaitForCloseRetryCount = 10
    }

    #Stop Studio
    $Output = ""
    taskkill /im "Warewolf Studio.exe"  2>&1 | %{$Output = $_}

    #Soft Kill
    [int]$i = 0
    [string]$WaitTimeoutMessage = "This command stopped operation because process "
    [string]$WaitOutput = $WaitTimeoutMessage
    while (!($Output.ToString().StartsWith("ERROR: ")) -and $WaitOutput.ToString().StartsWith($WaitTimeoutMessage) -and $i -lt $WaitForCloseRetryCount) {
	    $i += 1
	    Write-Host $Output.ToString()
	    Wait-Process "Warewolf Studio" -Timeout ([math]::Round($WaitForCloseTimeout/$WaitForCloseRetryCount))  2>&1 | %{$WaitOutput = $_}
        $FormatWaitForCloseTimeoutMessage = $WaitOutput.ToString().replace($WaitTimeoutMessage, "")
        if ($FormatWaitForCloseTimeoutMessage -ne "" -and !($FormatWaitForCloseTimeoutMessage.StartsWith("Cannot find a process with the name "))) {
            Write-Host $FormatWaitForCloseTimeoutMessage
        }
	    taskkill /im "Warewolf Studio.exe"  2>&1 |  %{$Output = $_}
    }

    #Force Kill
    taskkill /im "Warewolf Studio.exe" /f  2>&1 | %{if (!($_.ToString().StartsWith("ERROR: "))) {Write-Host $_}}

    #Stop Server
    $ServiceOutput = ""
    sc.exe stop "Warewolf Server" 2>&1 | %{$ServiceOutput += "`n" + $_}
    if ($ServiceOutput -ne "`n[SC] ControlService FAILED 1062:`n`nThe service has not been started.`n") {
        Write-Host $ServiceOutput.TrimStart("`n")
        Wait-Process "Warewolf Server" -Timeout $WaitForCloseTimeout  2>&1 | out-null
    }
    taskkill /im "Warewolf Server.exe" /f  2>&1 | out-null

    #Delete All Studio and Server Resources Except Logs
    $ToClean = "$env:LOCALAPPDATA\Warewolf\DebugData\PersistSettings.dat",
               "$env:LOCALAPPDATA\Warewolf\UserInterfaceLayouts\WorkspaceLayout.xml",
               "$env:PROGRAMDATA\Warewolf\Resources",
               "$env:PROGRAMDATA\Warewolf\Tests",
               "$env:PROGRAMDATA\Warewolf\Workspaces",
               "$env:PROGRAMDATA\Warewolf\Server Settings"

    [int]$ExitCode = 0
    foreach ($FileOrFolder in $ToClean) {
	    Remove-Item $FileOrFolder -Recurse -ErrorAction SilentlyContinue
	    if (Test-Path $FileOrFolder) {
		    Write-Host Cannot delete $FileOrFolder
		    $ExitCode = 1
	    }	
    }
    if ($ExitCode -eq 1) {
        sleep 30
        exit 1
    }
}

function Install-Server {
    if ($ResourcesType -eq "") {
	    $title = "Server Resources"
	    $message = "What type of resources would you like to install the server with?"

	    $UITest = New-Object System.Management.Automation.Host.ChoiceDescription "&UITest", `
		    "Uses these resources for running UI Tests."

	    $ServerTest = New-Object System.Management.Automation.Host.ChoiceDescription "&ServerTests", `
		    "Uses these resources for running everything except unit tests and Coded UI tests."

	    $Release = New-Object System.Management.Automation.Host.ChoiceDescription "&Release", `
		    "Uses these resources for Warewolf releases."

	    $options = [System.Management.Automation.Host.ChoiceDescription[]]($UITest, $ServerTest, $Release)

	    $result = $host.ui.PromptForChoice($title, $message, $options, 0) 

	    switch ($result)
		    {
			    0 {$ResourcesType = "UITests"}
			    1 {$ResourcesType = "ServerTests"}
			    2 {$ResourcesType = "Release"}
		    }
    }

    if ($ServerPath -eq "") {
        $ServerPath = FindFile-InParent $ServerPathSpecs
        if ($ServerPath.EndsWith(".zip")) {
			    Expand-Archive "$PSScriptRoot\*Server.zip" "$CurrentDirectory\Server" -Force
			    $ServerPath = "$PSScriptRoot\Server\" + $ServerExeName
		    }
        if ($ServerPath -eq "") {
            Write-Host Cannot find Warewolf Server.exe. Please provide a path to that file as a commandline parameter like this: -ServerPath
            sleep 30
            exit 1
        }
    }

    $ServerService = Get-Service "Warewolf Server" -ErrorAction SilentlyContinue
    if (!$DotCover.IsPresent) {
        if ($ServerService -eq $null) {
            New-Service -Name "Warewolf Server" -BinaryPathName "$ServerPath" -StartupType Manual
        } else {    
		    Write-Host Configuring service to $ServerPath
		    sc.exe config "Warewolf Server" binPath= "$ServerPath"
        }
    } else {
        $ServerBinDir = (Get-Item $ServerPath).Directory.FullName 
        $RunnerXML = @"
<AnalyseParams>
<TargetExecutable>$ServerPath</TargetExecutable>
<TargetArguments></TargetArguments>
<Output>$env:ProgramData\Warewolf\Server Log\dotCover.dcvr</Output>
<Scope>
	<ScopeEntry>$ServerBinDir\**\*.dll</ScopeEntry>
	<ScopeEntry>$ServerBinDir\**\*.exe</ScopeEntry>
</Scope>
</AnalyseParams>
"@

        Out-File -LiteralPath "$ServerBinDir\DotCoverRunner.xml" -Encoding default -InputObject $RunnerXML
        $BinPathWithDotCover = "\`"" + $DotCoverPath + "\`" cover \`"" + $ServerBinDir + "\DotCoverRunner.xml\`" /LogFile=\`"$env:ProgramData\Warewolf\Server Log\dotCover.log\`""
        if ($ServerService -eq $null) {
            New-Service -Name "Warewolf Server" -BinaryPathName "$BinPathWithDotCover" -StartupType Manual
	    } else {
		    Write-Host Configuring service to $BinPathWithDotCover
		    sc.exe config "Warewolf Server" binPath= "$BinPathWithDotCover"
	    }
    }
    if ($ServerUsername -ne "" -and $ServerPassword -eq "") {
        sc.exe config "Warewolf Server" obj= "$ServerUsername"
    }
    if ($ServerUsername -ne "" -and $ServerPassword -ne "") {
        sc.exe config "Warewolf Server" obj= "$ServerUsername" password= "$ServerPassword"
    }

    $ResourcePathSpecs = @()
    foreach ($ServerPathSpec in $ServerPathSpecs) {
        if ($ServerPathSpec.EndsWith($ServerExeName)) {
            $ResourcePathSpecs += $ServerPathSpec.Replace($ServerExeName, "Resources - $ResourcesType")
        }
    }
    $ResourcesDirectory = FindFile-InParent $ResourcePathSpecs
    if ($ResourcesPath -ne "" -and $ResourcesDirectory -ne (Get-Item $ServerPath).Directory.FullName + "\" + (Get-Item $ResourcesDirectory).Name ) {
        Copy-Item -Path "$ResourcesDirectory" -Destination (Get-Item $ServerPath).Directory.FullName -Recurse -Force
    }

    Write-Host Cleaning up old resources in Warewolf ProgramData and copying in new resources from ((Get-Item $ServerPath).Directory.FullName + "\Resources - $ResourcesType\*").
    Cleanup-ServerStudio 10 1
    Copy-Item -Path ((Get-Item $ServerPath).Directory.FullName + "\Resources - $ResourcesType\*") -Destination "$env:ProgramData\Warewolf" -Recurse -Force
}

function Start-Server {
    Start-Service "Warewolf Server"
    Write-Host Server has started.

    #Check if started
    $Output = @()
    sc.exe interrogate "Warewolf Server" 2>&1 | %{$Output += $_}
    if ($Output.Length -lt 4 -or !($Output[3].EndsWith("RUNNING "))) {
        sc.exe start "Warewolf Server"
    }
}

function Start-Studio {
    $StudioLogFile = "$env:LocalAppData\Warewolf\Studio Logs\Warewolf Studio.log"
    if (Test-Path $StudioLogFile) {
        #Studio Log File Backup
        $num = 1
        while(Test-Path -Path "$StudioLogFile.$num")
        {
            $num += 1
        }
        $StudioLogFile | Move-Item -Destination "$StudioLogFile.$num"
    }
	if (!$DotCover.IsPresent) {
		Start-Process "$StudioPath"
	} else {
        $StudioBinDir = (Get-Item $StudioPath).Directory.FullName 
        $RunnerXML = @"
<AnalyseParams>
<TargetExecutable>$StudioPath</TargetExecutable>
<TargetArguments></TargetArguments>
<LogFile>$env:LocalAppData\Warewolf\Studio Logs\dotCover.log</LogFile>
<Output>$env:LocalAppData\Warewolf\Studio Logs\dotCover.dcvr</Output>
<Scope>
	<ScopeEntry>$StudioBinDir\**\*.dll</ScopeEntry>
	<ScopeEntry>$StudioBinDir\**\*.exe</ScopeEntry>
</Scope>
</AnalyseParams>
"@

        Out-File -LiteralPath "$StudioBinDir\DotCoverRunner.xml" -Encoding default -InputObject $RunnerXML
		Start-Process $DotCoverPath "cover `"$StudioBinDir\DotCoverRunner.xml`" /LogFile=`"$env:LocalAppData\Warewolf\Studio Logs\dotCover.log`""
    }
    while (!(Test-Path $StudioLogFile)){
        Write-Warning 'Waiting for Studio to start...'
        Sleep 3
    }
	Write-Host Studio has started.
}

function AssemblyIsNotAlreadyDefinedWithoutWildcards([string]$AssemblyNameToCheck) {
    $JobAssemblySpecs = @()
    foreach ($Job in $JobSpecs.Values) {
        if ($Job.Count -eq 1) {
            $JobAssemblySpecs += $Job
        } else {
            $JobAssemblySpecs += $Job[0]
        }
    }
    !$JobAssemblySpecs.Contains($AssemblyNameToCheck)
}

if ($StartServer.IsPresent -or $StartStudio.IsPresent) {
    if ($ServerPath -ne "" -and !(Test-Path $ServerPath)) {
        Write-Host Server path not found: $ServerPath
        sleep 30
        exit 1
    }
    if ($StudioPath -ne "" -and !(Test-Path $StudioPath)) {
        Write-Host Studio path not found: $StudioPath
        sleep 30
        exit 1
    }
    if ($DotCoverPath -ne "" -and !(Test-Path $DotCoverPath)) {
        Write-Host DotCover path not found: $DotCoverPath
        sleep 30
        exit 1
    }
    Install-Server
}

if ($StartStudio.IsPresent) {
    $StudioPath = FindFile-InParent $StudioPathSpecs
    if ($StudioPath.EndsWith(".zip")) {
	    Expand-Archive "$StudioPath" "$PSScriptRoot\Studio" -Force
	    $StudioPath = "$PSScriptRoot\Studio\" + $StudioExeName
    }
	if ($StudioPath -eq "") {
		Write-Host Cannot find Warewolf Studio. To run the studio provide a path to the Warewolf Studio exe file as a commandline parameter like this: -StudioPath
        sleep 30
		exit 1
	}
}

#Unpack jobs
$JobNames = @()
$JobAssemblySpecs = @()
$JobCategories = @()
if ($JobName -ne $null -and $JobName -ne "") {
    foreach ($Job in $JobName.Split(",")) {
        $JobNames += $Job
        if ($JobSpecs[$Job].Count -eq 1) {
            $JobAssemblySpecs += $JobSpecs[$Job]
            $JobCategories += ""
        } else {
            $JobAssemblySpecs += $JobSpecs[$Job][0]
            $JobCategories += $JobSpecs[$Job][1]
        }
    }
} else {if ($RunAllJobs.IsPresent) {
    $JobSpecs.Keys.ForEach({
        $JobNames += $_
        if ($JobSpecs[$_].Count -eq 1) {
            $JobAssemblySpecs += $JobSpecs[$_]
            $JobCategories += ""
        } else {
            $JobAssemblySpecs += $JobSpecs[$_][0]
            $JobCategories += $JobSpecs[$_][1]
        }
    })
}}
$TotalNumberOfJobsToRun = $JobNames.length
if ($TotalNumberOfJobsToRun -gt 0) {
    $DefaultVSTestPath = "$env:vs140comntools..\IDE\CommonExtensions\Microsoft\TestWindow\VSTest.console.exe"
    if ($VSTestPath -eq "" -and (Test-Path $DefaultVSTestPath) -and $MSTestPath -eq "") {
        $VSTestPath = $DefaultVSTestPath
    }
    $DefaultMSTestPath = "$env:vs140comntools..\IDE\MSTest.exe"
    if ($MSTestPath -eq "" -and (Test-Path $DefaultMSTestPath)) {
        $MSTestPath = $DefaultMSTestPath
    }
    if (($VSTestPath -eq $null -or $VSTestPath -eq "" -or !(Test-Path $VSTestPath)) -and ($MSTestPath -eq $null -or $MSTestPath -eq "" -or !(Test-Path $MSTestPath))) {
        Write-Host Error cannot find VSTest.console.exe or MSTest.exe. Use either -VSTestPath or -MSTestPath parameters to pass paths to one of those files.
        sleep 30
        exit 1
    }

    if ($VSTestPath -ne $null -and $VSTestPath -ne "" -and (Test-Path $VSTestPath) -and !$MSTest.IsPresent) {
        # Read playlists and args.
        $TestList = ""
        if ($Args.Count -gt 0) {
            $TestList = $Args.ForEach({ "," + $_ })
        } else {
            Get-ChildItem "$PSScriptRoot" -Filter *.playlist | `
            Foreach-Object{
	            [xml]$playlistContent = Get-Content $_.FullName
	            if ($playlistContent.Playlist.Add.count -gt 0) {
	                foreach( $TestName in $playlistContent.Playlist.Add) {
		                $TestList += "," + $TestName.Test.SubString($TestName.Test.LastIndexOf(".") + 1)
	                }
	            } else {        
                    if ($playlistContent.Playlist.Add.Test -ne $null) {
                        $TestList = " /Tests:" + $playlistContent.Playlist.Add.Test.SubString($playlistContent.Playlist.Add.Test.LastIndexOf(".") + 1)
                    } else {
	                    Write-Host Error parsing Playlist.Add from playlist file at $_.FullName
                    }
                }
            }
        }
        if ($TestList.StartsWith(",")) {
	        $TestList = $TestList -replace "^.", " /Tests:"
        }
    } else {
        $TestList = ""
        if ($Args.Count -gt 0) {
            $TestList = $Args.ForEach({ "," + $_ })
        } else {
            Get-ChildItem "$PSScriptRoot" -Filter *.playlist | `
            Foreach-Object{
	            [xml]$playlistContent = Get-Content $_.FullName
	            if ($playlistContent.Playlist.Add.count -gt 0) {
	                foreach( $TestName in $playlistContent.Playlist.Add) {
		                $TestList += " /test:" + $TestName.Test.SubString($TestName.Test.LastIndexOf(".") + 1)
	                }
	            } else {        
                    if ($playlistContent.Playlist.Add.Test -ne $null) {
                        $TestList = " /test:" + $playlistContent.Playlist.Add.Test.SubString($playlistContent.Playlist.Add.Test.LastIndexOf(".") + 1)
                    } else {
	                    Write-Host Error parsing Playlist.Add from playlist file at $_.FullName
                    }
                }
            }
        }
    }
    foreach ($_ in 0..($TotalNumberOfJobsToRun-1)) {
        if ($StartServer.IsPresent -or $StartStudio.IsPresent) {
            Start-Server
        }
        if ($StartStudio.IsPresent) {
            Start-Studio
        }
        $ProjectSpec = $JobAssemblySpecs[$_].ToString()
        $JobName = $JobNames[$_].ToString()
        $TestAssembliesList = ""
        $TestAssembliesDirectories = @()
        if ($TestsPath -ne "" -and !($TestsPath.EndsWith("\"))) { $TestsPath += "\" }
        foreach ($Project in $ProjectSpec.Split(",")) {
            $SolutionFolderPath = FindFile-InParent @($TestsPath + $Project + ".dll")
            foreach ($file in Get-ChildItem $SolutionFolderPath) {
                $AssemblyNameToCheck = $file.Name.replace($file.extension, "")
                if (AssemblyIsNotAlreadyDefinedWithoutWildcards $AssemblyNameToCheck) {
                    if (!$TestAssembliesDirectories.Contains($file.Directory.FullName)) {
                        $TestAssembliesDirectories += $file.Directory.FullName
                    }
                    if ((Test-Path $VSTestPath) -and !$MSTest.IsPresent) {
		                $TestAssembliesList = $TestAssembliesList + " `"" + $file.FullName + "`""
                    } else {
		                $TestAssembliesList = $TestAssembliesList + " /testcontainer:`"" + $file.FullName + "`""
                    }
	            }
            }
            if ($TestAssembliesList -eq "") {
                $SolutionFolderPath = FindFile-InParent @($TestsPath + $Project)
                foreach ($folder in Get-ChildItem $SolutionFolderPath) {
                    $SolutionFolderPath = FindFile-InParent @($TestsPath + $Project)
                    if (AssemblyIsNotAlreadyDefinedWithoutWildcards $file.Name) {
                        if (!$TestAssembliesDirectories.Contains($folder)) {
                            $TestAssembliesDirectories += $folder.FullName
                        }
                        if ((Test-Path $VSTestPath) -and !$MSTest.IsPresent) {
		                    $TestAssembliesList = $TestAssembliesList + " `"" + $folder.FullName + "\bin\Debug\" + $folder.Name + ".dll`""
                        } else {
		                    $TestAssembliesList = $TestAssembliesList + " /testcontainer:`"" + $folder.FullName + "\bin\Debug\" + $folder.Name + ".dll`""
                        }
	                }
                }
            }
        }
        if ($TestAssembliesList -eq "") {
	        Write-Host Cannot find any $ProjectSpec project folders or assemblies at $PSScriptRoot.
	        exit 1
        }
        if ((Test-Path $VSTestPath) -and !$MSTest.IsPresent) {
            # Create full VSTest argument string.
            $FullArgsList = $TestAssembliesList + " /logger:trx " + $TestList

            # Write full command including full argument string.
            Out-File -LiteralPath "$PSScriptRoot\RunTests.bat" -Append -Encoding default -InputObject `"$VSTestPath`"$FullArgsList
        } else {
            #Resolve test results file name
            $TestResultsFile = $PSScriptRoot + "\TestResults\" + $JobName + " Results.trx"
            if (!(Test-Path $PSScriptRoot\TestResults)) {
	            New-Item -ItemType Directory $PSScriptRoot\TestResults
            }

            # Create full MSTest argument string.
            $FullArgsList = $TestAssembliesList + " /resultsfile:`"" + $TestResultsFile + "`" " + $TestList

            # Write full command including full argument string.
            Out-File -LiteralPath "$PSScriptRoot\RunTests.bat" -Encoding default -InputObject `"$MSTestPath`"$FullArgsList
        }
        if ($DotCover.IsPresent -and !$StartServer.IsPresent -and !$StartStudio.IsPresent) {
            # Write DotCover Runner XML 
            $DotCoverArgs = @"
<AnalyseParams>
	<TargetExecutable>$PSScriptRoot\RunTests.bat</TargetExecutable>
	<TargetArguments></TargetArguments>
	<Output>$PSScriptRoot\$JobName DotCover Output.dcvr</Output>
	<Scope>
"@
        foreach ($TestAssembliesDirectory in $TestAssembliesDirectories) {
            $DotCoverArgs += @"

        <ScopeEntry>$TestAssembliesDirectory\**\*.dll</ScopeEntry>
        <ScopeEntry>$TestAssembliesDirectory\**\*.exe</ScopeEntry>
"@
        }
$DotCoverArgs += @"

	</Scope>
</AnalyseParams>
"@
            Out-File -LiteralPath "$PSScriptRoot\DotCoverRunner.xml" -Encoding default -InputObject $DotCoverArgs

            #Write DotCover Runner Batch File
            Out-File -LiteralPath $PSScriptRoot\RunDotCover.bat -Encoding default -InputObject "`"$DotCoverPath`" cover `"$PSScriptRoot\DotCoverRunner.xml`""
        }
        if (Test-Path "$PSScriptRoot\RunTests.bat") {
            if (!$DotCover.IsPresent -and ($StartServer.IsPresent -or $StartStudio.IsPresent)) {
                &"$PSScriptRoot\RunTests.bat"
                Cleanup-ServerStudio 10 1
                Rename-Item "$PSScriptRoot\RunTests.bat" "$PSScriptRoot\Run $JobName.bat"
            } else {
                &"$PSScriptRoot\RunDotCover.bat"
                Cleanup-ServerStudio 10 1
                Rename-Item "$PSScriptRoot\RunTests.bat" "$PSScriptRoot\Run $JobName.bat"
                Rename-Item "$PSScriptRoot\RunDotCover.bat" "$PSScriptRoot\Run $JobName DotCover.bat"
                Rename-Item "$PSScriptRoot\DotCoverRunner.xml" "$PSScriptRoot\$JobName DotCover Runner.xml"
                Rename-Item "$PSScriptRoot\DotCoverRunner.xml.log" "$PSScriptRoot\$JobName DotCover Runner.xml.log"
            }
        }
    }

    $TestResultsFolder = FindFile-InParent @("*.trx","TestResults\*.trx")
    if ($TestResultsFolder -ne $null -and $TestResultsFolder -ne "" -and (Test-Path "$TestResultsFolder")) {
        # Write failing tests playlist.
        Write-Host Writing all test failures in `"$TestResultsFolder`" to a playlist file

        Get-ChildItem "$TestResultsFolder" -Filter *.trx | Rename-Item -NewName {$_.name -replace ' ','_' }

        $PlayList = "<Playlist Version=`"1.0`">"
        Get-ChildItem "$TestResultsFolder" -Filter *.trx | `
        Foreach-Object{
	        [xml]$trxContent = Get-Content $_.FullName
	        if ($trxContent.TestRun.Results.UnitTestResult.count -gt 0) {
	            foreach($TestResult in $trxContent.TestRun.Results.UnitTestResult) {
		            if ($TestResult.outcome -eq "Failed") {
		                if ($trxContent.TestRun.TestDefinitions.UnitTest.TestMethod.count -gt 0) {
		                    foreach($TestDefinition in $trxContent.TestRun.TestDefinitions.UnitTest.TestMethod) {
			                    if ($TestDefinition.name -eq $TestResult.testName) {
				                    $PlayList += "<Add Test=`"" + $TestDefinition.className + "." + $TestDefinition.name + "`" />"
			                    }
		                    }
                        } else {
			                Write-Host Error parsing TestRun.TestDefinitions.UnitTest.TestMethod from trx file at $_.FullName
			                Continue
		                }
		            }
	            }
	        } elseif ($trxContent.TestRun.Results.UnitTestResult.outcome -eq "Failed") {
                $PlayList += "<Add Test=`"" + $trxContent.TestRun.TestDefinitions.UnitTest.TestMethod.className + "." + $trxContent.TestRun.TestDefinitions.UnitTest.TestMethod.name + "`" />"
            } else {
		        Write-Host Error parsing TestRun.Results.UnitTestResult from trx file at $_.FullName
            }
        }
        $PlayList += "</Playlist>"
        $OutPlaylistPath = $TestResultsFolder + "\" + $PlaylistFileName + ".playlist"
        $PlayList | Out-File -LiteralPath $OutPlaylistPath -Encoding utf8 -Force
        Write-Host Playlist file written to `"$OutPlaylistPath`".
    }
} else {
    if ($StartServer.IsPresent -or $StartStudio.IsPresent) {
        Start-Server
    }
    if ($StartStudio.IsPresent) {
        Start-Studio
    }
}

if ($Cleanup.IsPresent) {
    if ($DotCover.IsPresent) {
        Cleanup-ServerStudio 1800 10
    } else {
        Cleanup-ServerStudio 10 1
    }
}