#!/bin/bash

echo 'Removing collections'
mongo pac --eval 'db.getCollection("ventures").drop()'
mongo pac --eval 'db.getCollection("digs").drop()'
mongo pac --eval 'db.getCollection("estagios").drop()'

mongoimport --db pac --collection digs --ignoreBlanks --headerline --type csv --file digs.csv
mongoimport --db pac --collection estagios --ignoreBlanks --headerline --type csv --file estagios.csv

for file in pac*.csv
do
  mongoimport --db pac --collection ventures --ignoreBlanks --headerline --type csv --file $file
done

echo 'Creating Indexes'
mongo pac --eval 'db.ventures.ensureIndex({"idn_digs": 1})'
mongo pac --eval 'db.ventures.ensureIndex({"idn_estagio": 1})'

mongo pac --eval 'db.ventures.find({idn_digs: {$gt: 999 , $lt: 1006}}).forEach( function(doc) {   db.ventures.update(doc, {$set : { idn_digs: db.digs.findOne( {idn_digs: doc.idn_digs}, {'_id': false, 'Tipo': true, 'Subeixo': true}) } })  });'

mongo pac --eval 'db.ventures.find({idn_digs: {$gt: 1999 , $lt: 2006}}).forEach( function(doc) {   db.ventures.update(doc, {$set : { idn_digs: db.digs.findOne( {idn_digs: doc.idn_digs}, {'_id': false, 'Tipo': true, 'Subeixo': true}) } })  });'

mongo pac --eval 'db.ventures.find({idn_digs: {$gt: 2999 , $lt: 3004}}).forEach( function(doc) {   db.ventures.update(doc, {$set : { idn_digs: db.digs.findOne( {idn_digs: doc.idn_digs}, {'_id': false, 'Tipo': true, 'Subeixo': true}) } })  });'

mongo pac --eval 'db.ventures.find({idn_digs: {$gt: 3999 , $lt: 4005}}).forEach( function(doc) {   db.ventures.update(doc, {$set : { idn_digs: db.digs.findOne( {idn_digs: doc.idn_digs}, {'_id': false, 'Tipo': true, 'Subeixo': true}) } })  });'

mongo pac --eval 'db.ventures.find({idn_digs: {$gt: 4999, $lt: 5003}}).forEach( function(doc) {   db.ventures.update(doc, {$set : { idn_digs: db.digs.findOne( {idn_digs: doc.idn_digs}, {'_id': false, 'Tipo': true, 'Subeixo': true}) } })  });'

mongo pac --eval 'db.ventures.find({idn_digs: {$gt: 5999, $lt: 6003}}).forEach( function(doc) {   db.ventures.update(doc, {$set : { idn_digs: db.digs.findOne( {idn_digs: doc.idn_digs}, {'_id': false, 'Tipo': true, 'Subeixo': true}) } })  });'

mongo pac --eval 'db.ventures.find({idn_estagio: {$gt: -1, $lt: 4}}).forEach( function(doc) { db.ventures.update(doc, {$set : { idn_estagio: db.estagios.findOne( {codigo_idn_estagio: doc.idn_estagio}, {'_id': false, 'estagio': true, 'descricao': true}) } })  });'

mongo pac --eval 'db.ventures.find({idn_estagio: 5}).forEach( function(doc) { db.ventures.update(doc, {$set : { idn_estagio: db.estagios.findOne( {codigo_idn_estagio: doc.idn_estagio}, {'_id': false, 'estagio': true, 'descricao': true}) } })  });'

mongo pac --eval 'db.ventures.find({idn_estagio: 10}).forEach( function(doc) { db.ventures.update(doc, {$set : { idn_estagio: db.estagios.findOne( {codigo_idn_estagio: doc.idn_estagio}, {'_id': false, 'estagio': true, 'descricao': true}) } })  });'

mongo pac --eval 'db.ventures.find({idn_estagio: {$gt: 39, $lt: 42}}).forEach( function(doc) { db.ventures.update(doc, {$set : { idn_estagio: db.estagios.findOne( {codigo_idn_estagio: doc.idn_estagio}, {'_id': false, 'estagio': true, 'descricao': true}) } })  });'

mongo pac --eval 'db.ventures.find({idn_estagio: {$gt: 69, $lt: 72}}).forEach( function(doc) { db.ventures.update(doc, {$set : { idn_estagio: db.estagios.findOne( {codigo_idn_estagio: doc.idn_estagio}, {'_id': false, 'estagio': true, 'descricao': true}) } })  });'

mongo pac --eval 'db.ventures.find({idn_estagio: {$gt: 89, $lt: 92}}).forEach( function(doc) { db.ventures.update(doc, {$set : { idn_estagio: db.estagios.findOne( {codigo_idn_estagio: doc.idn_estagio}, {'_id': false, 'estagio': true, 'descricao': true}) } })  });'
