package com.kylefrost.whatcolorisit;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Window;
import android.os.Handler;
import android.widget.TextView;
import java.text.SimpleDateFormat;
import android.view.View;
import java.util.Date;
import java.util.Calendar;
import android.graphics.Color;
import android.view.Menu;
import android.view.MenuItem;

public class MainActivity extends ActionBarActivity {

    // Define Date Format
    private SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

    private TextView mClock;

    private boolean mActive;

    private final Handler mHandler = new Handler();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        View decorView = getWindow().getDecorView();
        int uiOptions = View.SYSTEM_UI_FLAG_FULLSCREEN;
        decorView.setSystemUiVisibility(uiOptions);

        mClock = (TextView) findViewById(R.id.clock_label);
        mClock.setTextSize(60.0f); // set size
        mClock.setTextColor(Color.WHITE); // set font color

        // Start clock
        startClock();
    }

    /*
     * Update UI Time
     */
    private final Runnable mRunnable = new Runnable() {
        public void run() {
            if (mActive) {
                if (mClock != null) {
                    mClock.setText(getTime());
                }
                //set time after the specified amount of time elapses
                mHandler.postDelayed(mRunnable, 1000);
            }
        }
    };

    /*
     * Get System time
     */
    private String getTime() {
        // return sdf.format(new Date(System.currentTimeMillis()));
        Calendar c = Calendar.getInstance();
        int seconds = c.get(Calendar.SECOND);
        int min= c.get(Calendar.MINUTE);
        int hour= c.get(Calendar.HOUR_OF_DAY);

        String numSeconds;
        if (seconds < 10) {
            numSeconds = String.format("0%d", seconds);
        } else {
            numSeconds = String.format("%d", seconds);
        }


        return String.format("%d : %d : %s", hour, min, numSeconds);
    }

    /*
     * Start clock
     */
    private void startClock() {
        mActive = true;
        mHandler.post(mRunnable);
    }
}

