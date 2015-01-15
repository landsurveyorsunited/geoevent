angular.module \main, <[0media.events]>
  ..controller \main, <[$scope $timeout]> ++ ($scope,$timeout) ->
    #host = "http://0media.tw/t/geoevent"
    host = "http://zbryikt.github.io/geoevent"
    #host = ""
    $scope.initz = 'auto'
    $scope.autoll = true
    $scope.clat = null
    $scope.clng = null
    $scope.sid = null
    $scope.style = 'default'
    $scope.ratio = 20
    $scope.zlvs = ['auto'] ++ [i for i from 1 to 18]
    $scope.set-style = -> $scope.style = it
    $scope.set-ratio = -> $scope.ratio = it
    $scope.update-widget = ->
      $timeout ->
        if !$scope.sid or !$scope.style or !$scope.ratio => return
        if !$scope.autoll and !($scope.clat and $scope.clng) => return
        $scope.outurl = "/widget/?src=#{$scope.sid}&color=#{$scope.style}&ratio=#{$scope.ratio}"
        if $scope.clat and $scope.clng => $scope.outurl += "&clat=#{$scope.clat}&clng=#{$scope.clng}"
        if $scope.zlvs.indexOf($scope.initz)>=1 => $scope.outurl += "&initz=#{$scope.initz}"
        $scope.outurlwithhost = host + $scope.outurl
        $scope.embedcode = "<iframe src='#host#{$scope.outurl}'>"
        $(\#result).attr \src, $scope.outurlwithhost
      , 1000
    $scope.generate = -> $scope.update-widget!
    $scope.$watch 'datasrc', -> 
      ret = /\/d\/([^\/]+)/.exec $scope.datasrc
      if !ret => $scope.sid = null
      else $scope.sid = ret.1
    $scope.config = do
      src: \1yY4pqGqI3rLMf5bQqe5XMztnnJ78RMUrfh-XpJdhd_o
      color: \default
      ratio: 20
      clat: 24.862211
      clng: 75.148265
      initz: 1

