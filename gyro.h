#ifndef GYRO_H
#define GYRO_H
#include <QQuickView>
#include <QString>

class Gyro : public QQuickView
{
    Q_OBJECT
    Q_PROPERTY(double x READ gyro_x_read  NOTIFY authorChanged)
    Q_PROPERTY(double y READ gyro_y_read  NOTIFY authorChanged)
    Q_PROPERTY(double z READ gyro_z_read  NOTIFY authorChanged)
signals:
    void getgyroread(double x,double y,double z);
    void authorChanged();
public slots:

protected:

private:
    void gyro_write(double yaw,double pitch,double roll);
public:
    explicit Gyro(QWindow *parent = nullptr);

    double  gyro_x_read() const {return m_x;}
    double  gyro_y_read() const {return m_y;}
    double  gyro_z_read() const {return m_z;}

    double m_x;
    double m_y;
    double m_z;
    QString m_str;

    void putData(const QByteArray &data);
};


#endif // GYRO_H
