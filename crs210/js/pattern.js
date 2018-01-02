function generatePattern(n) {
  var line;
  var i;
  var j;
  var k;

  for (i = 1; i <= n; i++) {
    line = '';

    for (j = 1; j <= i; j++) {
      line += String(j);
    }

    for (k = 1; ; k++) {
      if (k > n - i) {
        break;
      }
      line += '*';
    }

    console.log(line);
  }
}

generatePattern(1);
generatePattern(4);
generatePattern(8);