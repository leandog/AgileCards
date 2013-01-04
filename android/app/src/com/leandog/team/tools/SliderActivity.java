package com.leandog.team.tools;

import android.app.Activity;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Gallery;
import android.widget.ImageView;

public class SliderActivity extends Activity {

    private Gallery cardGallery;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        TypedArray cards;
        String title = "";
        setContentView(R.layout.activity_card_slider);
        cardGallery = (Gallery) findViewById(R.id.card_gallery);

        switch (getIntent().getIntExtra(Constants.CARDS, R.id.const_thinking_hats)) {
        case R.id.const_thinking_hats:
            title = getString(R.string.thinking_hats);
            cards = getResources().obtainTypedArray(R.array.thinking_hats);
            break;
        case R.id.const_collaberation_8:
            title = getString(R.string.collaberation);
            cards = getResources().obtainTypedArray(R.array.collaberation);
            break;
        case R.id.const_fist_to_five:
            title = getString(R.string.fist_to_five);
            cards = getResources().obtainTypedArray(R.array.fist_to_five);
            break;
        case R.id.const_t_shirt_sizing:
            title = getString(R.string.tshirt);
            cards = getResources().obtainTypedArray(R.array.tshirt);
            break;
        default:
            title = getString(R.string.thinking_hats);
            cards = getResources().obtainTypedArray(R.array.thinking_hats);
            break;
        }

        setTitle(title);
        cardGallery.setAdapter(new CardAdapter(getBaseContext(), R.layout.adapter_slider_cards, cards));
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        boolean handled = false;
        if (item.getItemId() == android.R.id.home) {
            finish();
            handled = true;
        } else {
            handled = super.onOptionsItemSelected(item);
        }
        return handled;
    }

    private class CardAdapter extends ArrayAdapter<Integer> {

        private TypedArray cards;
        private int layoutId;

        public CardAdapter(Context context, int layoutId, TypedArray cards) {
            super(context, layoutId);
            this.layoutId = layoutId;
            this.cards = cards;
        }

        @Override
        public int getCount() {
            return cards.length();
        }

        @Override
        public Integer getItem(int position) {
            return cards.getResourceId(position, R.drawable.ic_launcher);
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            if (convertView == null) {
                convertView = createView();
            }

            ((ImageView) convertView.findViewById(R.id.image)).setImageResource(getItem(position));
            return convertView;
        }

        private View createView() {
            return LayoutInflater.from(getContext()).inflate(layoutId, null);
        }
    }

}
