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

function Controller() {
    installer.setDefaultPageWidget(QInstaller.Introduction);
    installer.setPageVisible(QInstaller.Introduction, true);
    installer.setPageVisible(QInstaller.LicenseAgreement, true);
    installer.setPageVisible(QInstaller.TargetDirectory, true);
    installer.setPageVisible(QInstaller.ReadyForInstallation, true);
    installer.setPageVisible(QInstaller.Installation, true);
    
    // Check if we are on Windows
    if (installer.platform() === "windows") {
        // Create a desktop shortcut
        createDesktopShortcut();
        // Create a start menu shortcut
        createStartMenuShortcut();
    }
}

// Function to create a desktop shortcut
function createDesktopShortcut() {
    var desktopPath = QStandardPaths.writableLocation(QStandardPaths.DesktopLocation);
    
    // Define the path to your application executable
    var targetPath = installer.value("TargetDir") + "/chrome.exe"; // Application executable
    
    // Create the shortcut
    var shortcut = new QProcess();
    var args = [];
    
    // For Windows, use "cmd.exe /C" to create a shortcut using Windows Script Host
    args.push('/C', 'mkshortcut');
    args.push('/F:' + desktopPath + "/Cromite.lnk");
    args.push('/A:C');
    args.push('/T:' + targetPath);
    
    // Execute the process to create the shortcut
    shortcut.start("cmd.exe", args);
    shortcut.waitForFinished();
}

// Function to create a start menu shortcut
function createStartMenuShortcut() {
    var startMenuDir = installer.value("StartMenuDir"); // Folder for Start Menu
    var targetPath = installer.value("TargetDir") + "/cromite.exe"; // Application executable
    
    // Create the Start Menu shortcut
    var shortcut = new QProcess();
    var args = [];

    // For Windows, use "cmd.exe /C" to create a shortcut using Windows Script Host
    args.push("cmd.exe");
    args.push("/C");
    args.push("mkshortcut");
    args.push("/F:" + startMenuDir + "/Cromite.lnk"); // The shortcut filename
    args.push("/A:C");
    args.push("/T:" + targetPath);
    
    // Execute the process to create the shortcut
    shortcut.start("cmd.exe", args);
    shortcut.waitForFinished();
}
