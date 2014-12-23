package com.kylefrost.whatcolorisit;

import android.graphics.Typeface;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.os.Handler;
import android.widget.TextView;
import android.view.View;
import java.util.Calendar;
import android.graphics.Color;

public class MainActivity extends ActionBarActivity {

    private TextView mClock;
    private TextView mHex;

    private boolean mActive;

    private final Handler mHandler = new Handler();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        View decorView = getWindow().getDecorView();
        int uiOptions = View.SYSTEM_UI_FLAG_FULLSCREEN;
        decorView.setSystemUiVisibility(uiOptions);

        Typeface font = Typeface.createFromAsset(getAssets(), "OpenSans-Light.ttf");

        mClock = (TextView) findViewById(R.id.clock_label);
        mClock.setTextSize(60.0f);
        mClock.setTextColor(Color.WHITE);
        mClock.setTypeface(font);

        mHex = (TextView) findViewById(R.id.hex_view);
        mHex.setTextSize(20.0f);
        mHex.setTextColor(Color.WHITE);
        mHex.setTypeface(font);

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
                    mHex.setText(getHex());
                    getWindow().getDecorView().setBackgroundColor(Color.parseColor(getHex()));
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
        int min = c.get(Calendar.MINUTE);
        int hour = c.get(Calendar.HOUR_OF_DAY);

        String numHours;
        String numMinutes;
        String numSeconds;

        if (min < 10) {
            numHours = String.format("0%d", hour);
        } else {
            numHours = String.format("%d", hour);
        }

        if (min < 10) {
            numMinutes = String.format("0%d", min);
        } else {
            numMinutes = String.format("%d", min);
        }

        if (seconds < 10) {
            numSeconds = String.format("0%d", seconds);
        } else {
            numSeconds = String.format("%d", seconds);
        }


        return String.format("%s : %s : %s", numHours, numMinutes, numSeconds);
    }

    private String getHex() {
        Calendar c = Calendar.getInstance();
        int seconds = c.get(Calendar.SECOND);
        int min = c.get(Calendar.MINUTE);
        int hour = c.get(Calendar.HOUR_OF_DAY);

        String numHours;
        String numMinutes;
        String numSeconds;

        if (min < 10) {
            numHours = String.format("0%d", hour);
        } else {
            numHours = String.format("%d", hour);
        }

        if (min < 10) {
            numMinutes = String.format("0%d", min);
        } else {
            numMinutes = String.format("%d", min);
        }

        if (seconds < 10) {
            numSeconds = String.format("0%d", seconds);
        } else {
            numSeconds = String.format("%d", seconds);
        }


        return String.format("#%s%s%s", numHours, numMinutes, numSeconds);
    }

    /*
     * Start clock
     */
    private void startClock() {
        mActive = true;
        mHandler.post(mRunnable);
    }
}

