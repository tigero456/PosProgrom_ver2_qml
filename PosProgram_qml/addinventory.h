#ifndef ADDINVENTORY_H
#define ADDINVENTORY_H

#include <QObject>
#include <QSql>
#include "sqlquerymodel.h"
#include <QMessageBox>
#include <QDialog>

class AddInventory : public QObject
{
    Q_OBJECT
public:
    explicit AddInventory(QObject *parent = nullptr);

    Q_INVOKABLE void addiv(QString &categoryname, QString &categoryproductname, QString &mnumber){
        QSqlQuery query;
        QString c_code, sql_input_life, p_namecode, sql_now_life, p_code;

        sql_input_life.clear();

        query.prepare("select cartegory_code from cartegory where cartegory_name = '"+categoryname+"'");
        query.exec();
        query.next();
        c_code=query.value(0).toString();
        query.prepare("select product_code from product where product_name = '"+categoryproductname+"'");                 //준비
        query.exec();                            //실행
        query.next();
        p_namecode=query.value(0).toString();
        query.prepare("select max(inventory_life) from inventory where product_code = '"+p_namecode+"'");                 //준비
        query.exec();                            //실행
        query.next();
        sql_now_life=query.value(0).toString();       //DB에 저장된 유통기한

        if(c_code.toInt()==1){
            query.prepare("select date_add(curdate(), interval 180 day)");                 //준비
            query.exec();                            //실행
            query.next();
            sql_input_life=query.value(0).toString();
        }
        else if(c_code.toInt()==2){
            query.prepare("select date_add(curdate(), interval 180 day)");                 //준비
            query.exec();                            //실행
            query.next();
            sql_input_life=query.value(0).toString();
        }
        else if(c_code.toInt()==3){
            query.prepare("select date_add(curdate(), interval 180 day)");                 //준비
            query.exec();                            //실행
            query.next();
            sql_input_life=query.value(0).toString();
        }
        else if(c_code.toInt()==4){
            query.prepare("select product_code from inventory where product_code = '"+p_namecode+"'");                 //준비
            query.exec();                            //실행
            query.next();
            p_code=query.value(0).toString();

            if(p_code == p_namecode){
                query.prepare("update inventory set inventory_number = (inventory_number + '"+mnumber+"'), inventory_life = NULL where product_code = '"+p_code+"'");                 //준비

                query.exec();
/*                if(query.exec()){
                    QMessageBox::critical(this, tr("Save"), tr("Saved"));
                }
                    else{
                    QMessageBox::critical(this, tr("error::"), query.lastError().text());
                }
*/
            }
        }
        else if(c_code.toInt()==5){
            query.prepare("select date_add(curdate(), interval 7 day)");                 //준비
            query.exec();                            //실행
            query.next();
            sql_input_life=query.value(0).toString();
        }
        else if(c_code.toInt()==6){
            query.prepare("select date_add(curdate(), interval 30 day)");                 //준비
            query.exec();                            //실행
            query.next();
            sql_input_life=query.value(0).toString();
        }
        else if(c_code.toInt()==7){
            query.prepare("select product_code from inventory where product_code = '"+p_namecode+"'");                 //준비
            query.exec();                            //실행
            query.next();
            p_code=query.value(0).toString();

            if(p_code == p_namecode){
                query.prepare("update inventory set inventory_number = (inventory_number + '"+mnumber+"'), inventory_life = NULL where product_code = '"+p_code+"'");                 //준비

                query.exec();
/*                if(query.exec()){
                    QMessageBox::critical(this, tr("Save"), tr("Saved"));
                }
                    else{
                    QMessageBox::critical(this, tr("error::"), query.lastError().text());
                }
*/
            }
        }
        else if(c_code.toInt()==8){
            query.prepare("select date_add(curdate(), interval 180 day)");                 //준비
            query.exec();                            //실행
            query.next();
            sql_input_life=query.value(0).toString();
        }
        else if(c_code.toInt()==9){
            query.prepare("select date_add(curdate(), interval 365 day)");                 //준비
            query.exec();                            //실행
            query.next();
            sql_input_life=query.value(0).toString();
        }
        else{
            query.prepare("select date_add(curdate(), interval 365 day)");                 //준비
            query.exec();                            //실행
            query.next();
            sql_input_life=query.value(0).toString();
        }

        query.prepare("select product_code from inventory where product_code = '"+p_namecode+"'");                 //준비
        query.exec();                            //실행
        query.next();
        p_code=query.value(0).toString();

        if(c_code.toInt()!=4 && c_code.toInt()!=7){
            if(p_code == p_namecode && sql_input_life == sql_now_life){
                query.prepare("update inventory set inventory_number = (inventory_number + '"+mnumber+"') where inventory_life = '"+sql_input_life+"'");                 //준비

                query.exec();
/*                if(query.exec()){
                    QMessageBox::critical(this, tr("Save"), tr("Saved"));
                }
                    else{
                    QMessageBox::critical(this, tr("error::"), query.lastError().text());
                }
*/
           }
            else{
                query.prepare("insert into inventory (product_code, inventory_life, inventory_number) values('"+p_namecode+"', '"+sql_input_life+"', '"+mnumber+"')");

                query.exec();
/*                if(query.exec()){
                    QMessageBox::critical(this, tr("Save"), tr("Saved"));
                }
                    else{
                    QMessageBox::critical(this, tr("error::"), query.lastError().text());
                }
*/
            }
        }
    }


signals:

};

#endif // ADDINVENTORY_H
