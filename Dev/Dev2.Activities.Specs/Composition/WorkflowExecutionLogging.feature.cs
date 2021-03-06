﻿// ------------------------------------------------------------------------------
//  <auto-generated>
//      This code was generated by SpecFlow (http://www.specflow.org/).
//      SpecFlow Version:2.3.2.0
//      SpecFlow Generator Version:2.3.0.0
// 
//      Changes to this file may cause incorrect behavior and will be lost if
//      the code is regenerated.
//  </auto-generated>
// ------------------------------------------------------------------------------
#region Designer generated code
#pragma warning disable
namespace Dev2.Activities.Specs.Composition
{
    using TechTalk.SpecFlow;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "2.3.2.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [Microsoft.VisualStudio.TestTools.UnitTesting.TestClassAttribute()]
    public partial class WorkflowExecutionLoggingFeature
    {
        
        private static TechTalk.SpecFlow.ITestRunner testRunner;
        
        private Microsoft.VisualStudio.TestTools.UnitTesting.TestContext _testContext;
        
#line 1 "WorkflowExecutionLogging.feature"
#line hidden
        
        public virtual Microsoft.VisualStudio.TestTools.UnitTesting.TestContext TestContext
        {
            get
            {
                return this._testContext;
            }
            set
            {
                this._testContext = value;
            }
        }
        
        [Microsoft.VisualStudio.TestTools.UnitTesting.ClassInitializeAttribute()]
        public static void FeatureSetup(Microsoft.VisualStudio.TestTools.UnitTesting.TestContext testContext)
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner(null, 0);
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "WorkflowExecutionLogging", "    In order to get a detailed workflow execution log\r\n    As a warewolf user\r\n  " +
                    "  I want to be able to list all entry to exit execution log points", ProgrammingLanguage.CSharp, new string[] {
                        "ConnectAndLoadServer"});
            testRunner.OnFeatureStart(featureInfo);
        }
        
        [Microsoft.VisualStudio.TestTools.UnitTesting.ClassCleanupAttribute()]
        public static void FeatureTearDown()
        {
            testRunner.OnFeatureEnd();
            testRunner = null;
        }
        
        [Microsoft.VisualStudio.TestTools.UnitTesting.TestInitializeAttribute()]
        public virtual void TestInitialize()
        {
            if (((testRunner.FeatureContext != null) 
                        && (testRunner.FeatureContext.FeatureInfo.Title != "WorkflowExecutionLogging")))
            {
                global::Dev2.Activities.Specs.Composition.WorkflowExecutionLoggingFeature.FeatureSetup(null);
            }
        }
        
        [Microsoft.VisualStudio.TestTools.UnitTesting.TestCleanupAttribute()]
        public virtual void ScenarioTearDown()
        {
            testRunner.OnScenarioEnd();
        }
        
        public virtual void ScenarioSetup(TechTalk.SpecFlow.ScenarioInfo scenarioInfo)
        {
            testRunner.OnScenarioStart(scenarioInfo);
            testRunner.ScenarioContext.ScenarioContainer.RegisterInstanceAs<Microsoft.VisualStudio.TestTools.UnitTesting.TestContext>(TestContext);
        }
        
        public virtual void ScenarioCleanup()
        {
            testRunner.CollectScenarioErrors();
        }
        
        [Microsoft.VisualStudio.TestTools.UnitTesting.TestMethodAttribute()]
        [Microsoft.VisualStudio.TestTools.UnitTesting.DescriptionAttribute("Workflow execution entry point detailed log")]
        [Microsoft.VisualStudio.TestTools.UnitTesting.TestPropertyAttribute("FeatureTitle", "WorkflowExecutionLogging")]
        [Microsoft.VisualStudio.TestTools.UnitTesting.TestCategoryAttribute("ConnectAndLoadServer")]
        public virtual void WorkflowExecutionEntryPointDetailedLog()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("Workflow execution entry point detailed log", ((string[])(null)));
#line 7
this.ScenarioSetup(scenarioInfo);
#line 8
    testRunner.Given("\"Hello World\" stop on error is set to \"false\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 9
    testRunner.And("an existing workflow \"Hello World\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 10
 testRunner.When("a \"Hello World\" workflow request is received", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table592 = new TechTalk.SpecFlow.Table(new string[] {
                        "key",
                        "value"});
            table592.AddRow(new string[] {
                        "DsfDecision",
                        "If [[Name]] <> (Not Equal)"});
#line 11
    testRunner.Then("a detailed entry log is created", ((string)(null)), table592, "Then ");
#line hidden
            TechTalk.SpecFlow.Table table593 = new TechTalk.SpecFlow.Table(new string[] {
                        "key",
                        "value"});
            table593.AddRow(new string[] {
                        "[[Name]]",
                        "World"});
#line 14
    testRunner.And("it has these input parameter values", ((string)(null)), table593, "And ");
#line 17
    testRunner.And("execution is complete", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [Microsoft.VisualStudio.TestTools.UnitTesting.TestMethodAttribute()]
        [Microsoft.VisualStudio.TestTools.UnitTesting.DescriptionAttribute("Workflow execution stops on error detailed logs")]
        [Microsoft.VisualStudio.TestTools.UnitTesting.TestPropertyAttribute("FeatureTitle", "WorkflowExecutionLogging")]
        [Microsoft.VisualStudio.TestTools.UnitTesting.TestCategoryAttribute("ConnectAndLoadServer")]
        public virtual void WorkflowExecutionStopsOnErrorDetailedLogs()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("Workflow execution stops on error detailed logs", ((string[])(null)));
#line 19
this.ScenarioSetup(scenarioInfo);
#line 20
    testRunner.Given("\"Hello World\" stop on error is set to \"true\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 21
    testRunner.And("workflow execution entry point detailed logs are created and logged", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 22
    testRunner.When("a workflow stops on error", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 23
    testRunner.Then("execution is complete", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [Microsoft.VisualStudio.TestTools.UnitTesting.TestMethodAttribute()]
        [Microsoft.VisualStudio.TestTools.UnitTesting.DescriptionAttribute("Workflow execution completed detailed logs")]
        [Microsoft.VisualStudio.TestTools.UnitTesting.TestPropertyAttribute("FeatureTitle", "WorkflowExecutionLogging")]
        [Microsoft.VisualStudio.TestTools.UnitTesting.TestCategoryAttribute("ConnectAndLoadServer")]
        public virtual void WorkflowExecutionCompletedDetailedLogs()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("Workflow execution completed detailed logs", ((string[])(null)));
#line 25
this.ScenarioSetup(scenarioInfo);
#line 26
    testRunner.Given("\"Hello World\" stop on error is set to \"false\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 27
    testRunner.And("workflow execution entry point detailed logs are created and logged", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 28
    testRunner.And("a workflow stops on error has no logs", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table594 = new TechTalk.SpecFlow.Table(new string[] {
                        "key",
                        "value"});
            table594.AddRow(new string[] {
                        "DsfMultiAssignActivity",
                        "Set the output variable (1)"});
#line 29
    testRunner.Then("a detailed execution completed log entry is created", ((string)(null)), table594, "Then ");
#line hidden
            TechTalk.SpecFlow.Table table595 = new TechTalk.SpecFlow.Table(new string[] {
                        "key",
                        "value"});
            table595.AddRow(new string[] {
                        "[[Message]]",
                        "Hello World."});
#line 32
    testRunner.And("it has these output parameter values", ((string)(null)), table595, "And ");
#line 35
    testRunner.And("execution is complete", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [Microsoft.VisualStudio.TestTools.UnitTesting.TestMethodAttribute()]
        [Microsoft.VisualStudio.TestTools.UnitTesting.DescriptionAttribute("Workflow execution failure detailed logs")]
        [Microsoft.VisualStudio.TestTools.UnitTesting.TestPropertyAttribute("FeatureTitle", "WorkflowExecutionLogging")]
        [Microsoft.VisualStudio.TestTools.UnitTesting.TestCategoryAttribute("ConnectAndLoadServer")]
        public virtual void WorkflowExecutionFailureDetailedLogs()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("Workflow execution failure detailed logs", ((string[])(null)));
#line 37
this.ScenarioSetup(scenarioInfo);
#line 38
    testRunner.Given("\"Hello World\" stop on error is set to \"false\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 39
    testRunner.And("the workflow is expected to throw exception", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 40
    testRunner.And("workflow execution entry point detailed logs are created and logged", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 41
    testRunner.And("a workflow stops on error has no logs", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 42
    testRunner.When("a workflow execution has an exception", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table596 = new TechTalk.SpecFlow.Table(new string[] {
                        "key",
                        "value"});
            table596.AddRow(new string[] {
                        "Exception",
                        "False exception from WorkflowExecutionLoggingSteps"});
#line 43
    testRunner.Then("a detailed execution exception log entry is created", ((string)(null)), table596, "Then ");
#line 46
    testRunner.And("a detailed execution completed log entry will have no logs", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 47
    testRunner.And("execution is complete", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion
