#ifndef POLYEDITITEM_H
#define POLYEDITITEM_H

#include <QtGui>
#include <QGraphicsPolygonItem>
#include <QGraphicsSceneMouseEvent>


class PolyEditItem : public QObject, public QGraphicsPolygonItem
{
    Q_OBJECT

public:
    PolyEditItem(QGraphicsItem *parent=0);
    double Val();
    void   setVal(double I_val);
    QString Get_FillOpt();
    void   Set_FillOpt(const QString &I_FillOpt);

public slots:
    void UpdatePolygon( QPolygonF I_poly);
//  void resetPosition();

signals:
    void do_SetPolyVal(QPolygonF *MyPoly, double MyVal, const QString &MyFillOpt);
    void do_SceneUpdate();
    void do_UpdateNodes(QPolygonF MyPoly);

protected:
    QVariant itemChange(QGraphicsItem::GraphicsItemChange change, const QVariant &value);
    virtual void mousePressEvent(QGraphicsSceneMouseEvent *event);

private:

    double     MyVal     = 1.;
    QString    MyFillOpt = "Fill MaxVal";

};

#endif // POLYEDITITEM_H
