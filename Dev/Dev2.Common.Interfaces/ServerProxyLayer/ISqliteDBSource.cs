﻿/*
*  Warewolf - Once bitten, there's no going back
*  Copyright 2018 by Warewolf Ltd <alpha@warewolf.io>
*  Licensed under GNU Affero General Public License 3.0 or later. 
*  Some rights reserved.
*  Visit our website for more information <http://warewolf.io/>
*  AUTHORS <http://warewolf.io/authors.php> , CONTRIBUTORS <http://warewolf.io/contributors.php>
*  @license GNU Affero General Public License <http://www.gnu.org/licenses/agpl-3.0.html>
*/

using System;
using Dev2.Common.Interfaces.Core.DynamicServices;

namespace Dev2.Common.Interfaces.ServerProxyLayer
{
	public interface ISqliteDBSource : IEquatable<ISqliteDBSource>
	{
		enSourceType Type { get; set; }
		Guid Id { get; set; }
		string QueryString { get; set; }
	}
}