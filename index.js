/**
 * Created by Nagasudhir on 1/29/2018.
 */
var worker_g;

var app = angular.module("splitspense", ["ngRoute"]);

app.config(function ($routeProvider) {
    // get the default db
    worker_g = new Worker("./libs/worker.sql.js");
    $routeProvider
        .when("/", {
            templateUrl: "transaction_sets.htm"
        })
        .when("/red", {
            templateUrl: "red.htm"
        });
});

app.controller('transactionSetsCtrl', function ($scope) {
    $scope.message = "";
    $scope.transaction_sets = [];
    var setMessage = function (str) {
        $scope.message = str;
    };

    var execute = function (commands) {
        setMessage("Executing sql commands...");
        worker_g.onmessage = function (event) {
            setMessage("Results fetched from sql query");
            $scope.$apply();
            var results = event.data.results;
            setMessage(results);
            $scope.$apply();
        };
        worker_g.postMessage({action: 'exec', sql: commands});
    };

    var loadTransactionSets = function () {
        setMessage("Executing transaction sets fetch query...");
        $scope.$apply();
        worker_g.onmessage = function (event) {
            setMessage("Results fetched from transaction sets fetch query");
            $scope.$apply();
            var results = event.data.results;
            if(results.length == 0){
                $scope.transaction_sets = [];
                $scope.$apply();
            }else{
                results = results[0];
                setMessage(results);
                $scope.$apply();
                var columns = results.columns;
                results = results.values;
                var transactionSets = [];
                for (var i = 0; i < results.length; i++) {
                    var transactionSet = {};
                    for (var k = 0; k < columns.length; k++) {
                        transactionSet[columns[k]] = results[i][k];
                    }
                    transactionSets.push(transactionSet);
                }
                $scope.transaction_sets = transactionSets;
                $scope.$apply();
            }
        };
        worker_g.postMessage({action: 'exec', sql: transaction_sets_list_sql});
    };

    $scope.renameTransactionSet = function (trSetId, oldName) {
        var newName = prompt("Please enter your name", oldName);
        if (newName == null) {
            newName = "";
        }
        newName = newName.trim();
        if (newName == "" || newName == oldName) {
            $scope.message = 'Invalid New Transaction Set name provided...';
            return;
        }
        setMessage("Executing transaction set rename query...");
        worker_g.onmessage = function (event) {
            setMessage("Results fetched from transaction set rename query");
            loadTransactionSets();
        };
        worker_g.postMessage({action: 'exec', sql: transaction_set_rename_sql.printf({id: trSetId, newName: newName})});
    };

    $scope.insertTransactionSet = function () {
        var newName = prompt("Please enter your name", "");
        if (newName == null) {
            newName = "";
        }
        newName = newName.trim();
        if (newName == "") {
            $scope.message = 'Invalid New Transaction Set name provided...';
            return;
        }
        setMessage("Executing transaction set insertion query...");
        worker_g.onmessage = function (event) {
            setMessage("Results fetched from transaction set insert query");
            loadTransactionSets();
        };
        worker_g.postMessage({action: 'exec', sql: transaction_set_insert_sql.printf({newName: newName})});
    };

    $scope.deleteTransactionSet = function (trSetId, trSetName) {
        var ok = confirm("Are you sure to delete the transaction set " + trSetName + "?");
        if (!ok) {
            return;
        }
        setMessage("Executing transaction set deletion query...");
        worker_g.onmessage = function (event) {
            setMessage("Results fetched from transaction set deletion query");
            loadTransactionSets();
        };
        worker_g.postMessage({action: 'exec', sql: transaction_set_delete_sql.printf({id: trSetId})});
    };

    setMessage("Fetching db file...");
    var xhr = new XMLHttpRequest();
    xhr.open('GET', './db_queries/sql.db', true);
    xhr.responseType = 'arraybuffer';
    xhr.onload = function (e) {
        var uInt8Array = new Uint8Array(this.response);
        worker_g.onmessage = function () {
            loadTransactionSets();
        };
        try {
            setMessage("Opening db file...");
            worker_g.postMessage({action: 'open', buffer: uInt8Array}, [uInt8Array]);
        }
        catch (exception) {
            worker_g.postMessage({action: 'open', buffer: uInt8Array});
        }
    };
    xhr.send();

    var transaction_sets_list_sql = '   SELECT  ' +
        '     transaction_sets.id                                     AS _id,  ' +
        '     transaction_sets.*,  ' +
        '     MAX(transactions_details_summary.transaction_time)      AS max_time,  ' +
        '     MIN(transactions_details_summary.transaction_time)      AS min_time,  ' +
        '     SUM(transactions_details_summary.tran_contribution_sum) AS tran_set_worth  ' +
        '   FROM transaction_sets  ' +
        '     LEFT OUTER JOIN  ' +
        '     (SELECT  ' +
        '        transactions_details.*,  ' +
        '        SUM(transaction_contributions.contribution) AS tran_contribution_sum  ' +
        '      FROM transactions_details  ' +
        '        LEFT OUTER JOIN  ' +
        '        transaction_contributions ON transaction_contributions.transactions_details_id = transactions_details.id  ' +
        '      GROUP BY transactions_details.id  ' +
        '     ) AS transactions_details_summary  ' +
        '       ON transaction_sets.id = transactions_details_summary.transaction_sets_id  ' +
        '  GROUP BY transaction_sets.id;  ';

    var transaction_set_rename_sql = "UPDATE transaction_sets SET name_string = '{newName}' WHERE transaction_sets.id = {id};";

    var transaction_set_insert_sql = "INSERT INTO transaction_sets (name_string) VALUES ('{newName}');";

    var transaction_set_delete_sql = "DELETE FROM transaction_sets WHERE transaction_sets.id = {id};";
});

angular.bootstrap(document.getElementById("splitspense"), ['splitspense']);