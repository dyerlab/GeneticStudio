/******************************************************************************
*                       _                 _       _
*                    __| |_   _  ___ _ __| | __ _| |__
*                   / _` | | | |/ _ \ '__| |/ _` | '_ \
*                  | (_| | |_| |  __/ |  | | (_| | |_) |
*                   \__,_|\__, |\___|_|  |_|\__,_|_.__/
*                         |___/
*
*  mainwindow.cpp
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

#include "mainwindow.h"
#include "ui_mainwindow.h"

#include "fileio.h"

#include <QDir>
#include <QDebug>
#include <QVariant>
#include <QSettings>
#include <QCloseEvent>
#include <QFileDialog>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    this->makeActions();
    this->makeMenus();
    this->makeUI();

    this->loadSettings();

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::closeEvent(QCloseEvent *event) {
    saveSettings();
    event->accept();
}

void MainWindow::loadSettings() {
   QSettings settings("Dyerlab","Geno");
   move( settings.value("pos", QVariant(QPoint(100,100))).toPoint());
   resize( settings.value( "size", QVariant(QSize(400,500))).toSize());
   mainSplitter->restoreState( settings.value( "splitter", QVariant(QByteArray())).toByteArray());
}

void MainWindow::saveSettings() {
    QSettings settings("Dyerlab","Geno");
    settings.setValue("pos", QVariant( pos() ) );
    settings.setValue("size", QVariant( size() ));
    settings.setValue("splitter",QVariant( mainSplitter->saveState()));
}


/************************************* PROTECTED *************/


void MainWindow::makeActions() {
    actionNew = new QAction( tr("&New"), this );
    actionNew->setShortcut( tr("CTRL+N"));
    connect( actionNew, SIGNAL(triggered(bool)), this, SLOT( slotNew() ));

    actionOpen = new QAction( tr("&Open"), this );
    actionOpen->setShortcut( tr("CTRL+O"));
    connect( actionOpen, SIGNAL(triggered(bool)), this, SLOT(slotOpen()));

    actionQuit = new QAction( tr("&Quit"), this );
    actionQuit->setShortcut( tr("CTRL+Q"));
    connect( actionQuit, SIGNAL(triggered(bool)), qApp, SLOT(closeAllWindows()));
}

void MainWindow::makeMenus() {
    QMenu *fileMenu = this->menuBar()->addMenu(tr("&File"));
    fileMenu->addAction( actionNew );
    fileMenu->addAction( actionOpen );
    fileMenu->addSeparator();
    fileMenu->addAction( actionQuit );
}


void MainWindow::makeUI() {

    mainSplitter = new QSplitter();
    mainSplitter->setOrientation( Qt::Horizontal );

    tableView = new QTableView();

    treeView = new QTreeView();
    treeView->setAttribute( Qt::WA_MacShowFocusRect, false);
    treeView->setHeaderHidden(true);
    treeView->setSelectionMode(QAbstractItemView::SingleSelection);

    mainSplitter->addWidget(treeView);
    mainSplitter->addWidget(tableView);

    setCentralWidget( mainSplitter );
}




/********************************  SLOTS *******************/

void MainWindow::slotNew() {
    MainWindow *win = new MainWindow();
    QPoint pt = this->pos();
    pt.rx()+=10;
    pt.ry()+=10;
    win->move(pt);
    win->show();
}


void MainWindow::slotOpen() {
    QString path = QFileDialog::getOpenFileName( this,
                                                 QObject::tr("Open File"),
                                                 QDir::currentPath(),
                                                 QString("CSV (*.csv)") );
    if( path.isEmpty() )
        return;

    QList<QStringList> data = loadCsvFile( path );
    qDebug() << data;


}
