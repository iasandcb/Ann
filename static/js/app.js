angular.module('ann', [])
  .controller('ServicesController', function($scope, $http) {
      console.log('home');
      responsePromise = $http.get('/services');
      responsePromise.success(function(data, status, headers, config) {
          console.log(data);
          $scope.services = data;
      });

    });
