/****************************************************************************
**
** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the plugins of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include <qkmsvthandler.h>
#include <QtCore/private/qcrashhandler_p.h>
#include <QtGui/private/qguiapplication_p.h>
#include <sys/ioctl.h>
#include <linux/vt.h>
#include <linux/kd.h>

#ifdef K_OFF
#define KBD_OFF_MODE K_OFF
#else
#define KBD_OFF_MODE K_RAW
#endif

QT_BEGIN_NAMESPACE

QKmsVTHandler *QKmsVTHandler::self = 0;

QKmsVTHandler::QKmsVTHandler(QObject *parent)
    : QObject(parent), m_tty(-1)
{
    Q_ASSERT(!self);
    self = this;

    if (!isatty(0))
        return;

    m_tty = 0;

    ioctl(m_tty, KDGKBMODE, &m_oldKbdMode);
    if (!qgetenv("QT_KMS_TTYKBD").toInt()) {
        ioctl(m_tty, KDSKBMODE, KBD_OFF_MODE);
        QGuiApplicationPrivate *appd = QGuiApplicationPrivate::instance();
        Q_ASSERT(appd);
        QSegfaultHandler::initialize(appd->argv, appd->argc);
        QSegfaultHandler::installCrashHandler(crashHandler);
    }
}

QKmsVTHandler::~QKmsVTHandler()
{
    self->cleanup();
    self = 0;
}

void QKmsVTHandler::cleanup()
{
    if (m_tty == -1)
        return;

    ioctl(m_tty, KDSKBMODE, m_oldKbdMode);
}

void QKmsVTHandler::crashHandler()
{
    Q_ASSERT(self);
    self->cleanup();
}

QT_END_NAMESPACE
