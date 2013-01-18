package com.leandog.agile.cards;

import static com.xtremelabs.robolectric.Robolectric.shadowOf;
import static labs.leandog.android.testing.matchers.ActivityCoreMatchers.started;
import static org.hamcrest.CoreMatchers.equalTo;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;

import android.content.Intent;

import com.xtremelabs.robolectric.shadows.ShadowActivity;

@RunWith(TestRunner.class)
public class HomeActivityTest {

    HomeActivity activity = new HomeActivity();
    ShadowActivity shadowActivity = shadowOf(activity);

    @Test
    public void clicking_on_t_shirt_sizing_starts_slider_activity() {
        startActivityLifeCycle();
        clickOnView(R.id.t_shirt_sizing);
        assertThat(activity, started(SliderActivity.class));
    }

    @Test
    public void clicking_on_t_shirt_sizing_starts_slider_activity_for_t_shirts() {
        startActivityLifeCycle();
        clickOnView(R.id.t_shirt_sizing);
        assertThat(getIntentThatStartedActivity().getIntExtra(Constants.CARDS, -1), equalTo(R.id.const_t_shirt_sizing));
    }

    @Test
    public void clicking_on_fist_to_five_starts_slider_activity() {
        startActivityLifeCycle();
        clickOnView(R.id.fist_to_five);
        assertThat(activity, started(SliderActivity.class));
    }

    @Test
    public void clicking_on_fist_to_five_starts_slider_activity_for_fist_to_five() {
        startActivityLifeCycle();
        activity.findViewById(R.id.fist_to_five).performClick();
        clickOnView(R.id.fist_to_five);
        assertThat(getIntentThatStartedActivity().getIntExtra(Constants.CARDS, -1), equalTo(R.id.const_fist_to_five));
    }

    @Test
    public void clicking_on_fist_to_collaberation_8_slider_activity() {
        startActivityLifeCycle();
        clickOnView(R.id.collaberation_8);
        assertThat(activity, started(SliderActivity.class));
    }

    @Test
    public void clicking_on_collaberation_8_starts_slider_activity_for_collaberation_8() {
        startActivityLifeCycle();
        activity.findViewById(R.id.collaberation_8).performClick();
        clickOnView(R.id.collaberation_8);
        assertThat(getIntentThatStartedActivity().getIntExtra(Constants.CARDS, -1), equalTo(R.id.const_collaberation_8));
    }

    @Test
    public void clicking_on_fist_to_thinking_hats_slider_activity() {
        startActivityLifeCycle();
        clickOnView(R.id.thinking_hats);
        assertThat(activity, started(SliderActivity.class));
    }

    @Test
    public void clicking_on_thinking_hats_starts_slider_activity_for_thinking_hats() {
        startActivityLifeCycle();
        clickOnView(R.id.thinking_hats);
        assertThat(getIntentThatStartedActivity().getIntExtra(Constants.CARDS, -1), equalTo(R.id.const_thinking_hats));
    }

    private void clickOnView(int viewResourceId) {
        activity.findViewById(viewResourceId).performClick();
    }

    private Intent getIntentThatStartedActivity() {
        return shadowActivity.getNextStartedActivity();
    }

    private void startActivityLifeCycle() {
        shadowActivity.create();
    }
}
