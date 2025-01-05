/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the FOO module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:GPL-EXCEPT$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation with exceptions as appearing in the file LICENSE.GPL3-EXCEPT
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

function Component() {
    // Default constructor
}

Component.prototype.createOperations = function() {
    // Call default operations (like installing the files)
    component.createOperations();

    if (systemInfo.productType === "windows") {
        // Define the target executable for the shortcut
        var targetExecutable = "@TargetDir@/chrome.exe";  // Your application's executable
        
        // Define the custom icon path (using chrome.exe as the icon)
        var customIconPath = "@TargetDir@/chrome.exe";  // Using chrome.exe as the icon
        
        // Define other shortcut parameters (working directory, description, etc.)
        var workingDir = "@TargetDir@";  // Set working directory to the installation directory
        var description = "Launch Cromite"; // Description that appears for the shortcut
        
        // Create Start Menu Shortcut
        var startMenuShortcut = "@StartMenuDir@/Cromite.lnk"; // The shortcut file in Start Menu
        component.addOperation("CreateShortcut", targetExecutable, startMenuShortcut,
            "workingDirectory=" + workingDir,
            "iconPath=" + customIconPath,  // Using chrome.exe as the icon
            "iconId=0",  // No icon ID, because we're using an EXE file's icon
            "description=" + description);

        // Create Desktop Shortcut
        var desktopShortcut = "@DesktopDir@/Cromite.lnk"; // The shortcut file on the desktop
        component.addOperation("CreateShortcut", targetExecutable, desktopShortcut,
            "workingDirectory=" + workingDir,
            "iconPath=" + customIconPath,  // Using chrome.exe as the icon
            "iconId=0",  // No icon ID, because we're using an EXE file's icon
            "description=" + description);
    }
}
