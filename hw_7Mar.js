db.products.insertMany([
    {
        _id: 1,
        title: 'Велосипед',
        price: 45000,
        count: 12
    },
    {
        _id: 2,
        title: 'Сомокат',
        price: 1500,
        count: 10
    },
    {
        _id: 3,
        title: 'Ролики',
        price: 2000,
        count: 20
    },
    {
       _id: 4,
        title: 'Лыжи',
        price: 22000,
        count: 15
    },
    {
        _id: 5,
        title: 'Скейт',
        price: 19000,
        count: 4
    },
    {
        _id: 6,
        title: 'Сноуборд',
        price: 33000,
        count: 17
    }
]);

// У всех товаров, кол-во которых меньше 10, задайте кол-во 10
db.products.updateMany({count: {$lt: 10}}, {$set: {count: 10}});

// У всех товаров, цена которых меньше 20000 увеличьте цену на 5000
db.products.updateMany({price: {$lt: 20000}}, {$inc: {price: 5000}});

// Добавить свойство страны (country) а в качестве значения пустой массив. Свойство в дальнейшем будет содержать страны поставщиков
db.products.updateMany({}, {$set: {country: []}});

// Товарам с id 1 и 4 добавить в качестве поставщика(в массив country) Испанию
db.products.updateMany({_id: {$in: [1, 4]}}, {$push: {country: 'Испания'}});

// Товарам с id 1 и 3 добавить в качестве поставщиков Америку и Бразилию
db.products.updateMany({_id: {$in: [1, 3]}}, {$push: {country: {$each: ['Америка', 'Бразилия']}}});

// Товару с id 2 добавьте в качестве поставщика Японию, Корею и Китай
db.products.updateOne({_id: 2}, {$push: {country: {$each: ['Япония', 'Корея', 'Китай']}}});

// Для товара "Ролики" убрать поставщика Америка
db.products.updateOne({title: 'Ролики'}, {$pull: {country: 'Америка'}});

// Всем товарам добавить свойство quality со значением 0
db.products.updateMany({}, {$set: {quality: 0}});

// Товарам которые стоят больше 20000 установить в свойстве quality значение 10
db.products.updateMany({price: {$gt: 20000}}, {$set: {quality: 10}});

// Товарам которые стоят не больше 20000 установить в свойстве quality значение 5
db.products.updateMany({price: {$lte: 20000}}, {$set: {quality: 5}});

// Удалить поле count для всех товаров
db.products.updateMany({}, {$unset: {count: 1}});

// Всем товарам добавить в качестве поставщиков Францию и Италию
db.products.updateMany({}, {$push: {country: {$each: ['Франция', 'Италия']}}});

// Для товаров с id 1, 3 и 6 удалить поставщика Италия
db.products.updateMany({_id: {$in: [1, 3, 6]}}, {$pull: {country: 'Италия'}});