﻿using Microsoft.VisualStudio.TestTools.UITesting;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Warewolf.UITests.Tools
{
    [CodedUITest]
    public class HttpWebDelete
    {
        const string WebSourceName = "UITestingWebSource";
        const string WebDeleteName = "UITestingWebDeleteSource";

        [TestMethod]
        [TestCategory("Tools")]
        public void HttpWebDeleteToolUITest()
        {
            Uimap.Drag_DeleteWeb_Toolbox_Onto_Workflow_Surface();
            Uimap.Open_DeleteWeb_Tool_Large_View();
            Uimap.Click_AddNew_Web_Source_From_tool();
            Uimap.Type_TestSite_into_Web_Source_Wizard_Address_Textbox();
            Uimap.Save_With_Ribbon_Button_And_Dialog(WebSourceName, true);
            Uimap.Click_Close_Web_Source_Wizard_Tab_Button();
            Uimap.Save_With_Ribbon_Button_And_Dialog(WebDeleteName, true);
            Uimap.Click_Workflow_ExpandAll();
            Uimap.Select_UITestingSource_From_Web_Server_Large_View_Source_Combobox();
            Uimap.Click_DeleteWeb_Generate_Outputs();
        }
    
        #region Additional test attributes

        [TestInitialize]
        public void MyTestInitialize()
        {
            Uimap.SetPlaybackSettings();
#if !DEBUG
            Uimap.CloseHangingDialogs();
#endif
            Uimap.InitializeABlankWorkflow();
        }

        [TestCleanup]
        public void MyTestCleanup()
        {
            Uimap.TryRemoveFromExplorer(WebSourceName);
            Uimap.TryRemoveFromExplorer(WebDeleteName);
        }

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        private TestContext testContextInstance;

        UIMap Uimap
        {
            get
            {
                if (_uiMap == null)
                {
                    _uiMap = new UIMap();
                }

                return _uiMap;
            }
        }

        private UIMap _uiMap;

        #endregion
    }
}
