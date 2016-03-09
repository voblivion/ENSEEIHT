package fr.enseeiht.vdrouinv.videoplayer;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Environment;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import java.io.IOException;


public class VideoPlayer extends Activity implements SurfaceHolder.Callback {
    private static final String TAG = "Video Player Activity";
    private SurfaceView surfaceView;
    private SurfaceHolder surfaceHolder;
    private MediaPlayer mediaPlayer;
    private String path = new String();
    private int position;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_video_player);

        // SurfaceView
        mediaPlayer = new MediaPlayer();
        surfaceView = (SurfaceView) findViewById(R.id.surface_view);
        surfaceHolder = surfaceView.getHolder();
        surfaceHolder.addCallback(this);
        // if(Build.VERSION.SDK_INT < Build.VERSION_CODES.HONEYCOMB)
        //     surfaceHolder.setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);

        // GO button
        Button button = (Button)findViewById(R.id.go_button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EditText address = (EditText) findViewById(R.id.video_link);
                Intent get = new Intent(Intent.ACTION_VIEW);
                path = Environment.getExternalStorageDirectory().getPath() + "/" + String.valueOf(address.getText());
                get.setDataAndType(Uri.parse(path), "video/*");
                startActivity(get);
            }
        });

        // Restart button
        Button restart = (Button)findViewById(R.id.restart_button);
        restart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EditText address = (EditText) findViewById(R.id.video_link);
                path = Environment.getExternalStorageDirectory().getPath() + "/" + String.valueOf(address.getText());
                try {
                    mediaPlayer.setDataSource(path);
                    mediaPlayer.prepare();
                    mediaPlayer.start();
                }
                catch(IOException err) {
                    Log.d(TAG, "IOException");
                }
            }
        });
    }

    @Override
    public void surfaceCreated(SurfaceHolder holder) {
        Log.d(TAG, "Surface Created");
        mediaPlayer.setDisplay(surfaceHolder);
    }

    @Override
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {

    }

    @Override
    public void surfaceDestroyed(SurfaceHolder holder) {

    }

    @Override
    public void onPause() {
        super.onPause();
        position = mediaPlayer.getCurrentPosition();
        mediaPlayer.reset();
        mediaPlayer.release();
    }

    @Override
    public void onResume() {
        super.onResume();
        try {
            Log.d(TAG, "Onresume path="+path);
            mediaPlayer = new MediaPlayer();
            mediaPlayer.setDataSource(path);
            mediaPlayer.prepare();
            mediaPlayer.seekTo(position);
            mediaPlayer.start();
        }
        catch(IOException err) {
            Log.d(TAG, "IOException");
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_video_player, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
