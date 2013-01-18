package com.leandog.agile.cards;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;

public class HomeActivity extends Activity {

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        findViewById(R.id.t_shirt_sizing).setOnClickListener(new GameOnClickListener(R.id.const_t_shirt_sizing));
        findViewById(R.id.fist_to_five).setOnClickListener(new GameOnClickListener(R.id.const_fist_to_five));
        findViewById(R.id.collaberation_8).setOnClickListener(new GameOnClickListener(R.id.const_collaberation_8));
        findViewById(R.id.thinking_hats).setOnClickListener(new GameOnClickListener(R.id.const_thinking_hats));
    }

    private void showGame(int gameId) {
        Intent intent = new Intent(this, SliderActivity.class);
        intent.putExtra(Constants.CARDS, gameId);
        startActivity(intent);
    }
    
    private class GameOnClickListener implements OnClickListener {
        
        private final int gameId;

        public GameOnClickListener(int gameId) {
            this.gameId = gameId;
        }

        public void onClick(View view) {
            showGame(gameId);
        }
    }

}