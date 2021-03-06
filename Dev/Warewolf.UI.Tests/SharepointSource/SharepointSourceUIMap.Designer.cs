﻿// ------------------------------------------------------------------------------
//  <auto-generated>
//      This code was generated by coded UI test builder.
//      Version: 15.0.0.0
//
//      Changes to this file may cause incorrect behavior and will be lost if
//      the code is regenerated.
//  </auto-generated>
// ------------------------------------------------------------------------------

namespace Warewolf.UI.Tests.SharepointSource.SharepointSourceUIMapClasses
{
    using System;
    using System.CodeDom.Compiler;
    using System.Collections.Generic;
    using System.Drawing;
    using System.Text.RegularExpressions;
    using System.Windows.Input;
    using Microsoft.VisualStudio.TestTools.UITest.Extension;
    using Microsoft.VisualStudio.TestTools.UITesting;
    using Microsoft.VisualStudio.TestTools.UITesting.WpfControls;
    using Microsoft.VisualStudio.TestTools.UnitTesting;
    using Keyboard = Microsoft.VisualStudio.TestTools.UITesting.Keyboard;
    using Mouse = Microsoft.VisualStudio.TestTools.UITesting.Mouse;
    using MouseButtons = System.Windows.Forms.MouseButtons;
    
    
    [GeneratedCode("Coded UITest Builder", "15.0.26208.0")]
    public partial class SharepointSourceUIMap
    {
        
        #region Properties
        public MainStudioWindow MainStudioWindow
        {
            get
            {
                if ((this.mMainStudioWindow == null))
                {
                    this.mMainStudioWindow = new MainStudioWindow();
                }
                return this.mMainStudioWindow;
            }
        }
        #endregion
        
        #region Fields
        private MainStudioWindow mMainStudioWindow;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "15.0.26208.0")]
    public class MainStudioWindow : WpfWindow
    {
        
        public MainStudioWindow()
        {
            #region Search Criteria
            this.SearchProperties.Add(new PropertyExpression(WpfWindow.PropertyNames.Name, "Warewolf", PropertyExpressionOperator.Contains));
            this.SearchProperties.Add(new PropertyExpression(WpfWindow.PropertyNames.ClassName, "HwndWrapper", PropertyExpressionOperator.Contains));
            this.SearchConfigurations.Add(SearchConfiguration.AlwaysSearch);
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public DockManager DockManager
        {
            get
            {
                if ((this.mDockManager == null))
                {
                    this.mDockManager = new DockManager(this);
                }
                return this.mDockManager;
            }
        }
        #endregion
        
        #region Fields
        private DockManager mDockManager;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "15.0.26208.0")]
    public class DockManager : WpfCustom
    {
        
        public DockManager(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfControl.PropertyNames.ClassName] = "Uia.XamDockManager";
            this.SearchProperties[WpfControl.PropertyNames.AutomationId] = "DockManager";
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public SplitPaneMiddle SplitPaneMiddle
        {
            get
            {
                if ((this.mSplitPaneMiddle == null))
                {
                    this.mSplitPaneMiddle = new SplitPaneMiddle(this);
                }
                return this.mSplitPaneMiddle;
            }
        }
        #endregion
        
        #region Fields
        private SplitPaneMiddle mSplitPaneMiddle;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "15.0.26208.0")]
    public class SplitPaneMiddle : WpfCustom
    {
        
        public SplitPaneMiddle(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfControl.PropertyNames.ClassName] = "Uia.SplitPane";
            this.SearchProperties[WpfControl.PropertyNames.Instance] = "2";
            this.SearchConfigurations.Add(SearchConfiguration.NextSibling);
            this.SearchConfigurations.Add(SearchConfiguration.DisambiguateChild);
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public TabManSplitPane TabManSplitPane
        {
            get
            {
                if ((this.mTabManSplitPane == null))
                {
                    this.mTabManSplitPane = new TabManSplitPane(this);
                }
                return this.mTabManSplitPane;
            }
        }
        #endregion
        
        #region Fields
        private TabManSplitPane mTabManSplitPane;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "15.0.26208.0")]
    public class TabManSplitPane : WpfCustom
    {
        
        public TabManSplitPane(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfControl.PropertyNames.ClassName] = "Uia.SplitPane";
            this.SearchProperties[WpfControl.PropertyNames.AutomationId] = "UI_SplitPane_AutoID";
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public TabMan TabMan
        {
            get
            {
                if ((this.mTabMan == null))
                {
                    this.mTabMan = new TabMan(this);
                }
                return this.mTabMan;
            }
        }
        #endregion
        
        #region Fields
        private TabMan mTabMan;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "15.0.26208.0")]
    public class TabMan : WpfTabList
    {
        
        public TabMan(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfTabList.PropertyNames.AutomationId] = "UI_TabManager_AutoID";
            this.WindowTitles.Add("Warewolf");
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public SharepointServerSourceTab SharepointServerSourceTab
        {
            get
            {
                if ((this.mSharepointServerSourceTab == null))
                {
                    this.mSharepointServerSourceTab = new SharepointServerSourceTab(this);
                }
                return this.mSharepointServerSourceTab;
            }
        }
        #endregion
        
        #region Fields
        private SharepointServerSourceTab mSharepointServerSourceTab;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "15.0.26208.0")]
    public class SharepointServerSourceTab : WpfTabPage
    {
        
        public SharepointServerSourceTab(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfTabPage.PropertyNames.Name] = "Dev2.ViewModels.SourceViewModel`1[Dev2.Common.Interfaces.ISharepointServerSource]" +
                "";
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public SharepointServerSourceView SharepointServerSourceView
        {
            get
            {
                if ((this.mSharepointServerSourceView == null))
                {
                    this.mSharepointServerSourceView = new SharepointServerSourceView(this);
                }
                return this.mSharepointServerSourceView;
            }
        }
        
        public WpfButton CloseButton
        {
            get
            {
                if ((this.mCloseButton == null))
                {
                    this.mCloseButton = new WpfButton(this);
                    #region Search Criteria
                    this.mCloseButton.SearchProperties[WpfButton.PropertyNames.AutomationId] = "closeBtn";
                    this.mCloseButton.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mCloseButton;
            }
        }
        #endregion
        
        #region Fields
        private SharepointServerSourceView mSharepointServerSourceView;
        
        private WpfButton mCloseButton;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "15.0.26208.0")]
    public class SharepointServerSourceView : WpfCustom
    {
        
        public SharepointServerSourceView(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfControl.PropertyNames.ClassName] = "Uia.ContentPane";
            this.SearchProperties[WpfControl.PropertyNames.AutomationId] = "Dev2.Studio.ViewModels.WorkSurface.WorkSurfaceContextViewModel";
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public SharepointView SharepointView
        {
            get
            {
                if ((this.mSharepointView == null))
                {
                    this.mSharepointView = new SharepointView(this);
                }
                return this.mSharepointView;
            }
        }
        #endregion
        
        #region Fields
        private SharepointView mSharepointView;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "15.0.26208.0")]
    public class SharepointView : WpfCustom
    {
        
        public SharepointView(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfControl.PropertyNames.ClassName] = "Uia.SharepointServerSource";
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public WpfButton TestConnectionButton
        {
            get
            {
                if ((this.mTestConnectionButton == null))
                {
                    this.mTestConnectionButton = new WpfButton(this);
                    #region Search Criteria
                    this.mTestConnectionButton.SearchProperties[WpfButton.PropertyNames.AutomationId] = "TestConnection";
                    this.mTestConnectionButton.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mTestConnectionButton;
            }
        }
        
        public WpfRadioButton UserRadioButton
        {
            get
            {
                if ((this.mUserRadioButton == null))
                {
                    this.mUserRadioButton = new WpfRadioButton(this);
                    #region Search Criteria
                    this.mUserRadioButton.SearchProperties[WpfRadioButton.PropertyNames.AutomationId] = "UserRadioButton";
                    this.mUserRadioButton.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mUserRadioButton;
            }
        }
        
        public WpfEdit PasswordTextBox
        {
            get
            {
                if ((this.mPasswordTextBox == null))
                {
                    this.mPasswordTextBox = new WpfEdit(this);
                    #region Search Criteria
                    this.mPasswordTextBox.SearchProperties[WpfEdit.PropertyNames.AutomationId] = "PasswordTextBox";
                    this.mPasswordTextBox.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mPasswordTextBox;
            }
        }
        
        public WpfEdit ServerNameEdit
        {
            get
            {
                if ((this.mServerNameEdit == null))
                {
                    this.mServerNameEdit = new WpfEdit(this);
                    #region Search Criteria
                    this.mServerNameEdit.SearchProperties[WpfEdit.PropertyNames.AutomationId] = "ServerName";
                    this.mServerNameEdit.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mServerNameEdit;
            }
        }
        
        public WpfEdit UserNameTextBox
        {
            get
            {
                if ((this.mUserNameTextBox == null))
                {
                    this.mUserNameTextBox = new WpfEdit(this);
                    #region Search Criteria
                    this.mUserNameTextBox.SearchProperties[WpfEdit.PropertyNames.AutomationId] = "UserNameTextBox";
                    this.mUserNameTextBox.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mUserNameTextBox;
            }
        }
        
        public WpfRadioButton WindowsRadioButton
        {
            get
            {
                if ((this.mWindowsRadioButton == null))
                {
                    this.mWindowsRadioButton = new WpfRadioButton(this);
                    #region Search Criteria
                    this.mWindowsRadioButton.SearchProperties[WpfRadioButton.PropertyNames.AutomationId] = "WindowsRadioButton";
                    this.mWindowsRadioButton.WindowTitles.Add("Warewolf (DEV2\\DYLAN.DELPORT)");
                    #endregion
                }
                return this.mWindowsRadioButton;
            }
        }
        
        public WpfButton CancelTestButton
        {
            get
            {
                if ((this.mCancelTestButton == null))
                {
                    this.mCancelTestButton = new WpfButton(this);
                    #region Search Criteria
                    this.mCancelTestButton.SearchProperties[WpfButton.PropertyNames.AutomationId] = "CancelButton";
                    this.mCancelTestButton.WindowTitles.Add("Warewolf (DEV2\\DYLAN.DELPORT)");
                    #endregion
                }
                return this.mCancelTestButton;
            }
        }
        
        public WpfCustom Spinner
        {
            get
            {
                if ((this.mSpinner == null))
                {
                    this.mSpinner = new WpfCustom(this);
                    #region Search Criteria
                    this.mSpinner.SearchProperties[WpfControl.PropertyNames.ClassName] = "Uia.CircularProgressBar";
                    this.mSpinner.SearchProperties[WpfControl.PropertyNames.AutomationId] = "UI_SettingsProgress_Indicator";
                    this.mSpinner.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mSpinner;
            }
        }
        
        public WpfImage SuccessfulTestImage
        {
            get
            {
                if ((this.mSuccessfulTestImage == null))
                {
                    this.mSuccessfulTestImage = new WpfImage(this);
                    #region Search Criteria
                    this.mSuccessfulTestImage.SearchConfigurations.Add(SearchConfiguration.NextSibling);
                    this.mSuccessfulTestImage.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mSuccessfulTestImage;
            }
        }
        #endregion
        
        #region Fields
        private WpfButton mTestConnectionButton;
        
        private WpfRadioButton mUserRadioButton;
        
        private WpfEdit mPasswordTextBox;
        
        private WpfEdit mServerNameEdit;
        
        private WpfEdit mUserNameTextBox;
        
        private WpfRadioButton mWindowsRadioButton;
        
        private WpfButton mCancelTestButton;
        
        private WpfCustom mSpinner;
        
        private WpfImage mSuccessfulTestImage;
        #endregion
    }
}
