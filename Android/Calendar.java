// Placeholder file with some to-be-used code to get hour/minute/second

Calendar c = Calendar.getInstance(); 
int seconds = c.get(Calendar.SECOND); 
int min= c.get(Calendar.MINUTE); 
int hour= c.get(Calendar.HOUR); 
if(c.get(Calendar.AM_PM))//if returns pm add 12 to hour
Textview.append(hour + ":" + min + ":" + seconds );


// Possible way of updating every second (put in onCreate() method)

Thread t = new Thread() {

  @Override
  public void run() {
    try {
      while (!isInterrupted()) {
        Thread.sleep(1000);
        runOnUiThread(new Runnable() {
          @Override
          public void run() {
            // update TextView here!
          }
        });
      }
    } catch (InterruptedException e) {
    }
  }
};

t.start();




