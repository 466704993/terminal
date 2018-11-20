#include "gyro.h"
#include <QQuickView>
#include "QQmlEngine"
#include <QQmlContext>
#include <QMetaObject>
#include "qmetaobject.h"
#include <QtDebug>

Gyro::Gyro(QWindow *parent) :
    QQuickView(parent)
{
    m_x = 0;
    m_y = 0;
    m_z = 0;
    this->engine()->rootContext()->setContextProperty("gyro", this);
    this->setSource(QUrl::fromLocalFile("attitude.qml"));
}


void Gyro::gyro_write(double yaw,double pitch,double roll)
{
    m_x = yaw;
    m_y = pitch;
    m_z = roll;
}

// yaw : %f pitch : %f  roll : %f
 void Gyro::putData(const QByteArray &data)
 {
     QString string = data;
     if(string.indexOf("\n") == -1)
     {
         m_str.append(data);
     }
     else
     {
         m_str.append(string);
         QString str = m_str.section('\n', 0, 0);
         if(str.indexOf("yaw") != -1)
         {
            str = str.section("yaw : ", 1);
            QString a = str.section(" ", 0,0);
            m_z = - a.toDouble();
            str = str.section("pitch : ", 1);
            a = str.section(" ", 0,0);
            m_x = a.toDouble();
            str = str.section("roll : ", 1);
            m_y = str.toDouble();
            emit getgyroread(m_x,m_y,m_z);
         }
         str = m_str.section('\n', -1);
         m_str.clear();
         m_str.append(str);
     }

 }
