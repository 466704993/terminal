/********************************************************************************
** Form generated from reading UI file 'attitudedialog.ui'
**
** Created by: Qt User Interface Compiler version 5.11.2
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_ATTITUDEDIALOG_H
#define UI_ATTITUDEDIALOG_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>

QT_BEGIN_NAMESPACE

class Ui_AttitudeDialog
{
public:

    void setupUi(QDialog *AttitudeDialog)
    {
        if (AttitudeDialog->objectName().isEmpty())
            AttitudeDialog->setObjectName(QStringLiteral("AttitudeDialog"));
        AttitudeDialog->resize(400, 300);

        retranslateUi(AttitudeDialog);

        QMetaObject::connectSlotsByName(AttitudeDialog);
    } // setupUi

    void retranslateUi(QDialog *AttitudeDialog)
    {
        AttitudeDialog->setWindowTitle(QApplication::translate("AttitudeDialog", "Dialog", nullptr));
    } // retranslateUi

};

namespace Ui {
    class AttitudeDialog: public Ui_AttitudeDialog {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_ATTITUDEDIALOG_H
