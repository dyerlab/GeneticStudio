/******************************************************************************
*                       _                 _       _
*                    __| |_   _  ___ _ __| | __ _| |__
*                   / _` | | | |/ _ \ '__| |/ _` | '_ \
*                  | (_| | |_| |  __/ |  | | (_| | |_) |
*                   \__,_|\__, |\___|_|  |_|\__,_|_.__/
*                         |___/
*
*  fileio
*
*  Created: 3 2017 by rodney
*
*  Copyright 2017 rodney.  All Rights Reserved.
*
* This file may be distributed under the terms of GNU Public License version
* 3 (GPL v3) as defined by the Free Software Foundation (FSF). A copy of the
* license should have been included with this file, or the project in which
* this file belongs to. You may also find the details of GPL v3 at:
*
* http://www.gnu.org/licenses/gpl-3.0.txt
*
* If you have any questions regarding the use of this file, feel free to
* contact the author of this file, or the owner of the project in which
* this file belongs to.
*
******************************************************************************/

#include "fileio.h"
#include <QFile>
#include <QDebug>
#include <QTextStream>

QList<QStringList> loadCsvFile( QString path ) {

    QList<QStringList> ret;
    QFile file( path );

    if( file.open(QIODevice::ReadOnly|QIODevice::Text)) {

        QTextStream stream(&file);

        while( !stream.atEnd() ){
            QString line = stream.readLine();
            QStringList items = line.split(",",QString::SkipEmptyParts);
            ret.append( items );
        }

        qDebug() << "loaded" << ret.count() << "lines";

    } else {
        qDebug() << "Could not load file as read-only text file";
    }



    return ret ;
}
