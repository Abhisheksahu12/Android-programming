Practical 1: Create “Hello World” application that will display “Hello World” in the middle of the screen in the emulator. Also display “Hello World” inthe middle of the screen in the android phone.

Code:

activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
xmlns:app="http://schemas.android.com/apk/res-auto" xmlns:tools="http://schemas.android.com/tools" android:layout_width="match_parent" android:layout_height="match_parent" tools:context=".MainActivity">

<TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="Hello World!" android:textSize="50sp"
app:layout_constraintBottom_toBottomOf="parent" app:layout_constraintLeft_toLeftOf="parent" app:layout_constraintRight_toRightOf="parent" app:layout_constraintTop_toTopOf="parent" />

</androidx.constraintlayout.widget.ConstraintLayout>


MainActivity.java

package com.example.project1;


import androidx.appcompat.app.AppCompatActivity; import android.os.Bundle;
public class MainActivity extends AppCompatActivity { @Override
protected void onCreate(Bundle savedInstanceState) { super.onCreate(savedInstanceState); setContentView(R.layout.activity_main);
}
}

OUTPUT –



Practical 2: Create an application to display various android activitylifecycle   phases.

Code:

activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
xmlns:app="http://schemas.android.com/apk/res-auto" xmlns:tools="http://schemas.android.com/tools" android:layout_width="match_parent" android:layout_height="match_parent" tools:context=".MainActivity">

<TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="Hello World!"
app:layout_constraintBottom_toBottomOf="parent" app:layout_constraintLeft_toLeftOf="parent" app:layout_constraintRight_toRightOf="parent" app:layout_constraintTop_toTopOf="parent" />

</androidx.constraintlayout.widget.ConstraintLayout>


MainActivity.java
package com.example.program2;


import android.app.Activity; import android.os.Bundle; import android.util.Log;
public class MainActivity extends Activity { @Override
protected void onCreate(Bundle savedInstanceState) { super.onCreate(savedInstanceState); setContentView(R.layout.activity_main); Log.d("lifecycle","onCreate invoked");
}
@Override
protected void onStart() {

super.onStart(); Log.d("lifecycle","onStart invoked");
}

@Override
protected void onResume() { super.onResume(); Log.d("lifecycle","onResume invoked");
}
@Override
protected void onPause() {

super.onPause(); Log.d("lifecycle","onPause invoked");
}

@Override

protected void onStop() { super.onStop(); Log.d("lifecycle","onStop invoked");
}
@Override
protected void onRestart() { super.onRestart(); Log.d("lifecycle","onRestart invoked");
}
@Override
protected void onDestroy() { super.onDestroy(); Log.d("lifecycle","onDestroy invoked");
}
}

OUTPUT –


LOGCAT –
2022-02-19 12:05:08.979 8956-8956/com.example.program2 D/lifecycle: onStart invoked
2022-02-19 12:05:08.984 8956-8956/com.example.program2 D/lifecycle: onResume invoked
2022-02-19 12:05:09.064 8956-8985/com.example.program2 D/EGL_emulation: eglMakeCurrent: 0xdec85120: ver 2 0 (tinfo 0xdec83290)
2022-02-19 12:05:12.533 8956-8956/com.example.program2 D/lifecycle: onPause invoked
2022-02-19 12:05:12.552 8956-8985/com.example.program2 D/EGL_emulation: eglMakeCurrent: 0xdec85120: ver 2 0 (tinfo 0xdec83290)
2022-02-19 12:05:12.555 8956-8956/com.example.program2 D/lifecycle: onStop invoked
2022-02-19 12:05:17.867 8956-8956/com.example.program2 D/lifecycle: onRestart invoked
2022-02-19 12:05:17.867 8956-8956/com.example.program2 D/lifecycle: onStart invoked
2022-02-19 12:05:17.869 8956-8956/com.example.program2 D/lifecycle: onResume invoked
2022-02-19 12:05:17.945 8956-8985/com.example.program2 D/EGL_emulation: eglMakeCurrent: 0xdec85120: ver 2 0 (tinfo 0xdec83290)
2022-02-19 12:05:23.218 8956-8956/com.example.program2 D/lifecycle: onPause invoked
2022-02-19 12:05:23.232 8956-8985/com.example.program2 D/EGL_emulation: eglMakeCurrent: 0xdec85120: ver 2 0 (tinfo 0xdec83290)
2022-02-19 12:05:23.236 8956-8956/com.example.program2 D/lifecycle: onStop invoked
2022-02-19 12:05:24.963 8956-8956/com.example.program2 D/lifecycle: onDestroy invoked

Practical 3: Create an application with first activity with an editText and send button. On click of send button, make use of explicit intent to send textto second activity and display there in text view.

Code:

activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android" xmlns:app="http://schemas.android.com/apk/res-auto" xmlns:tools="http://schemas.android.com/tools" android:layout_width="match_parent" android:layout_height="match_parent" tools:context=".MainActivity">

<EditText android:id="@+id/send_text_id" android:layout_width="300dp" android:layout_height="wrap_content" android:layout_marginLeft="40dp" android:layout_marginTop="20dp" android:hint="Input" android:textSize="25dp" android:textStyle="bold" />
<Button android:id="@+id/send_button_id" android:layout_width="wrap_content"

android:layout_height="40dp" android:text="send" android:textStyle="bold" android:layout_marginTop="150dp" android:layout_marginLeft="150dp"/>

</RelativeLayout>


MainActivity.java
package com.example.program3;


import android.content.Intent;
import androidx.appcompat.app.AppCompatActivity; import android.os.Bundle;
import android.view.View; import android.widget.Button; import android.widget.EditText;

public class MainActivity extends AppCompatActivity { Button send_button;
EditText send_text; @Override
protected void onCreate(Bundle savedInstanceState)
{
super.onCreate(savedInstanceState); setContentView(R.layout.activity_main);
send_button = (Button)findViewById(R.id.send_button_id); send_text = (EditText)findViewById(R.id.send_text_id);

send_button.setOnClickListener(new View.OnClickListener() { @Override
public void onClick(View v)
{
String str = send_text.getText().toString();
Intent intent = new Intent(getApplicationContext(), MainActivity2.class); intent.putExtra("message_key", str);
startActivity(intent);
}
});

}

}

activity_second.xml
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android" xmlns:app="http://schemas.android.com/apk/res-auto" xmlns:tools="http://schemas.android.com/tools" android:layout_width="match_parent" android:layout_height="match_parent"
tools:context=".MainActivity2">


<TextView android:id="@+id/received_value_id" android:layout_width="300dp" android:layout_height="50dp" android:textStyle="bold" android:textSize="40dp" android:layout_marginTop="20dp"

android:layout_marginLeft="40dp"/>


</RelativeLayout>

SecondActivity.java
package com.example.program3; import android.content.Intent;
import androidx.appcompat.app.AppCompatActivity; import android.os.Bundle;
import android.widget.TextView;
public class MainActivity2 extends AppCompatActivity { TextView receiver_msg;
@Override
protected void onCreate(Bundle savedInstanceState)
{

super.onCreate(savedInstanceState); setContentView(R.layout.activity_main2);
receiver_msg = (TextView)findViewById(R.id.received_value_id); Intent intent = getIntent();
String str = intent.getStringExtra("message_key"); receiver_msg.setText(str);
}

}

OUTPUT –




Practical 4: Create an application with first activity with an editTextand send button. On click of send button, make use of implicit intent that uses aSEND ACTION and let user select app from app chooser and navigate to that application.

Code:

activity_main.xml
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android" xmlns:tools="http://schemas.android.com/tools" android:layout_width="match_parent" android:layout_height="match_parent" android:paddingLeft="@dimen/activity_horizontal_margin" android:paddingRight="@dimen/activity_horizontal_margin" android:paddingTop="@dimen/activity_vertical_margin" android:paddingBottom="@dimen/activity_vertical_margin" tools:context=".MainActivity">

<EditText android:id="@+id/editText1"
android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_alignParentRight="true" android:layout_alignParentTop="true" android:layout_marginRight="22dp" android:layout_marginTop="16dp"
/>

<EditText android:id="@+id/editText2"
android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_alignLeft="@+id/editText1" android:layout_below="@+id/editText1" android:layout_marginTop="20dp"
>


<requestFocus />
</EditText>


<EditText android:id="@+id/editText3"
android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_alignLeft="@+id/editText2" android:layout_below="@+id/editText2" android:layout_marginTop="30dp" android:inputType="textMultiLine" />

<TextView android:id="@+id/textView1"
android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_alignBaseline="@+id/editText1" android:layout_alignBottom="@+id/editText1"

android:layout_alignParentLeft="true" android:text="To:" />

<TextView android:id="@+id/textView2"
android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_alignBaseline="@+id/editText2" android:layout_alignBottom="@+id/editText2" android:layout_alignParentLeft="true" android:text="Subject:" />

<TextView android:id="@+id/textView3"
android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_alignBaseline="@+id/editText3" android:layout_alignBottom="@+id/editText3" android:layout_alignParentLeft="true" android:text="Message:" />

<Button android:id="@+id/button1"
android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_alignLeft="@+id/editText3" android:layout_below="@+id/editText3"

android:layout_marginLeft="70dp" android:layout_marginTop="25dp" android:text="Send" />
</RelativeLayout>


MainActivity.java
package com.example.program4; import android.app.Activity; import android.content.Intent;
import androidx.appcompat.app.AppCompatActivity; import android.os.Bundle;
import android.view.View; import android.widget.EditText; import android.view.Menu; import android.view.MenuItem; import android.widget.Button;
public class MainActivity extends Activity {


EditText editTextTo,editTextSubject,editTextMessage; Button send;
@Override
protected void onCreate(Bundle savedInstanceState) { super.onCreate(savedInstanceState); setContentView(R.layout.activity_main); editTextTo=(EditText)findViewById(R.id.editText1); editTextSubject=(EditText)findViewById(R.id.editText2); editTextMessage=(EditText)findViewById(R.id.editText3);

send=(Button)findViewById(R.id.button1); send.setOnClickListener(new View.OnClickListener(){
@Override
public void onClick(View arg0) {
String to=editTextTo.getText().toString();
String subject=editTextSubject.getText().toString(); String message=editTextMessage.getText().toString(); Intent email = new Intent(Intent.ACTION_SEND); email.putExtra(Intent.EXTRA_EMAIL, new String[]{ to}); email.putExtra(Intent.EXTRA_SUBJECT, subject); email.putExtra(Intent.EXTRA_TEXT, message); email.setType("message/rfc822");
startActivity(Intent.createChooser(email, "Choose an Email client :"));

}
});
}


@Override
public boolean onCreateOptionsMenu(Menu menu) { getMenuInflater().inflate(R.menu.example_menu, menu); return true;
}
@Override
public boolean onOptionsItemSelected(MenuItem item) { int id = item.getItemId();
if (id == R.id.actions) { return true;

}
return super.onOptionsItemSelected(item);
}
}


OUTPUT –







Practical 5: Create spinner with strings taken from resource folder (res
>> value folder) and on changing the spinner value, Image will change. Code:
Activity_main.xml

<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android" xmlns:app="http://schemas.android.com/apk/res-auto" xmlns:tools="http://schemas.android.com/tools" android:layout_width="match_parent" android:layout_height="match_parent" tools:context=".MainActivity"> <Spinner android:id="@+id/spinner"
android:layout_width="0dp" android:layout_height="wrap_content" android:layout_marginStart="8dp" android:layout_marginLeft="8dp" android:layout_marginTop="16dp" android:layout_marginEnd="8dp" android:layout_marginRight="8dp" app:layout_constraintEnd_toEndOf="parent" app:layout_constraintStart_toStartOf="parent" app:layout_constraintTop_toTopOf="parent" /><ImageView android:id="@+id/image"
android:layout_width="332dp" android:layout_height="323dp"

app:layout_constraintBottom_toBottomOf="parent" app:layout_constraintEnd_toEndOf="parent" app:layout_constraintStart_toStartOf="parent" app:layout_constraintTop_toTopOf="@+id/spinner" app:layout_constraintVertical_bias="0.479" />
</androidx.constraintlayout.widget.ConstraintLayout>
  
MainActivity.java
package com.example.p5;
import androidx.appcompat.app.AppCompatActivity; import android.os.Bundle; import android.view.View; import android.widget.AdapterView;
import android.widget.ArrayAdapter; import android.widget.ImageView; import android.widget.Spinner;
public class MainActivity extends AppCompatActivity { private Spinner spinner; private ImageView image;
@Override
protected void onCreate(Bundle savedInstanceState) { super.onCreate(savedInstanceState); setContentView(R.layout.activity_main);
spinner=findViewById(R.id.spinner); image=findViewById(R.id.image);
String [] birds={"Select One","s1","s2","s3","s4"};
ArrayAdapter<String>adapter=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_dropdown_item,birds);
spinner.setAdapter(adapter);
spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { @Override

public void onItemSelected(AdapterView<?> parent, View view, int position, long id) { switch (position){ case 1:
image.setImageResource(R.drawable.a); break; case 2: image.setImageResource(R.drawable.b); break; case 3:
image.setImageResource(R.drawable.c); break; case 4: image.setImageResource(R.drawable.d); break; } }




} }


Output –
@Override public void onNothingSelected(AdapterView<?> parent)
{ } });




	

Practical 6: Create a menu with 5 options and selected option shouldappear intext box in upper case.
Code:

Activity_main.xml

<?xml version="1.0" encoding="utf-8"?>  
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
xmlns:app="http://schemas.android.com/apk/res-auto" xmlns:tools="http://schemas.android.com/tools"
android:layout_width="match_parent" android:layout_height="match_parent" tools:context=".MainActivity">

<RelativeLayout android:layout_width="match_parent" android:layout_height="match_parent" android:layout_margin="80dp" app:layout_constraintBottom_toBottomOf="parent" app:layout_constraintLeft_toLeftOf="parent" app:layout_constraintRight_toRightOf="parent" app:layout_constraintTop_toTopOf="parent">

<EditText android:layout_width="match_parent" android:layout_height="wrap_content" android:id="@+id/etMenuItem" android:layout_centerInParent="true"


android:hint="Select an Option from the Menu" android:textAlignment="center" android:gravity="center_horizontal" />
</RelativeLayout>
</androidx.constraintlayout.widget.ConstraintLayout>


MainActivity.java
package com.example.p6; importandroidx.appcompat.app.AppCompatActivity; import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;import android.view.MenuItem; import android.widget.EditText;


public class MainActivity extends AppCompatActivity { private EditText etMenuIte
@Override
protected void onCreate(Bundle savedInstanceState) { super.onCreate(savedInstanceState); setContentView(R.layout.activity_main); etMenuItem=(EditText) findViewById(R.id.etMenuItem);
}
@Override
public boolean onCreateOptionsMenu(Menu menu){MenuInflater inflater=getMenuInflater(); inflater.inflate(R.menu.main_menu,menu); return true;
}
@Override
public boolean onOptionsItemSelected(MenuItem item){ etMenuItem.setText(item.getTitle().toString().toUpperCase());

return super.onOptionsItemSelected(item);
}
}


main_menu.xml


<?xml version="1.0" encoding="utf-8"?>  
<menu xmlns:android="http://schemas.android.com/apk/res/android">
<item
android:id="@+id/miSettings" android:title="@string/settings" />
<item
android:id="@+id/miBackup" android:title="@string/backup" />
<item
android:id="@+id/miReset" android:title="@string/reset" />
<item
android:id="@+id/miAbout" android:title="@string/about" />
<item
android:id="@+id/miHelp" android:title="@string/help" />
</menu>

Output -





Practical 7: Create a radio button group with radio button of all courses in your college and on selecting a particular course, teacher-in- charge ofthat course should appear at the bottom of the screen.


Code:

activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android" xmlns:app="http://schemas.android.com/apk/res-auto" xmlns:tools="http://schemas.android.com/tools" android:layout_width="match_parent" android:layout_height="match_parent" tools:context=".MainActivity">

<RelativeLayout android:layout_width="match_parent" android:layout_height="match_parent" android:layout_margin="75dp" app:layout_constraintBottom_toBottomOf="parent" app:layout_constraintLeft_toLeftOf="parent" app:layout_constraintRight_toRightOf="parent" app:layout_constraintTop_toTopOf="parent" >

<RadioGroup android:layout_width="match_parent" android:layout_height="wrap_content" android:id="@+id/rgCourses"

android:layout_centerInParent="true">
</RadioGroup>
</RelativeLayout>
</androidx.constraintlayout.widget.ConstraintLayout>


MainActivity.java


package com.example.p7;
import androidx.appcompat.app.AppCompatActivity; import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity; import android.os.Bundle;
import android.provider.MediaStore; import android.widget.RadioGroup; import android.widget.RadioButton;
import com.google.android.material.snackbar.Snackbar; import java.util.HashMap;
public class MainActivity extends AppCompatActivity { private RadioGroup rgCourses;
private HashMap<String, String> coursesMap; @Override
protected void onCreate(Bundle savedInstanceState) { super.onCreate(savedInstanceState); setContentView(R.layout.activity_main); initCourses();
}
private void initCourses(){ rgCourses=(RadioGroup)findViewById(R.id.rgCourses); if (coursesMap==null){
coursesMap=new HashMap<>();
coursesMap.put("BSc(H) Computer Science"," Harsh Meena");

coursesMap.put("BCom(H)"," Tejas Gupta"); coursesMap.put("BA(H) Sociology"," Pandey Sir"); for (String course : coursesMap.keySet()){
RadioButton rButton=new RadioButton(MainActivity.this); rButton.setText(course);
rgCourses.addView(rButton);

}
rgCourses.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() { @Override
public void onCheckedChanged(RadioGroup group, int checkedId) { int checkedRadioButtonId=rgCourses.getCheckedRadioButtonId();
RadioButton rButton=(RadioButton) findViewById(checkedRadioButtonId); Snackbar.make(rgCourses,coursesMap.get(rButton.getText()),Snackbar.LENGTH_SHORT)
.show();

}
});
}
}
}

OUTPUT –



Practical 8: Create a list of all courses in your college and on selectinga particular course parent department and the teacher-in-charge ofthat department should appear at the bottom of the screen.


Code:

activity_main.xml


<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android" xmlns:app="http://schemas.android.com/apk/res-auto" xmlns:tools="http://schemas.android.com/tools" android:layout_width="match_parent" android:layout_height="match_parent" tools:context=".MainActivity">

<RelativeLayout


android:layout_width="match_parent" android:layout_height="match_parent" android:layout_margin="90dp" app:layout_constraintBottom_toBottomOf="parent" app:layout_constraintLeft_toLeftOf="parent" app:layout_constraintRight_toRightOf="parent" app:layout_constraintTop_toTopOf="parent" >

<RadioGroup android:layout_width="match_parent"

android:layout_height="wrap_content" android:id="@+id/rgCourses" android:layout_centerInParent="true">
</RadioGroup>
</RelativeLayout>


</androidx.constraintlayout.widget.ConstraintLayout>


MainActivity.java


package com.example.p8;
import androidx.appcompat.app.AppCompatActivity; import android.os.Bundle;
import android.provider.MediaStore; import android.widget.RadioGroup; import android.widget.RadioButton;
import com.google.android.material.snackbar.Snackbar; import java.util.HashMap;

public class MainActivity extends AppCompatActivity { private RadioGroup rgCourses;
private HashMap<String, String> coursesMap; @Override
protected void onCreate(Bundle savedInstanceState) { super.onCreate(savedInstanceState); setContentView(R.layout.activity_main); initCourses();
}
private void initCourses(){ rgCourses=(RadioGroup)findViewById(R.id.rgCourses); if (coursesMap==null){

coursesMap=new HashMap<>();
coursesMap.put("BSc(H) Computer Science","Dept of Computer Sc - Mr. Harsh"); coursesMap.put("BCom(H)","Dept of Commerce - Mr. Tejas"); coursesMap.put("BA(H) Sociology"," Dept of Economics - Mr. Pandey");
for (String course : coursesMap.keySet()){
RadioButton rButton=new RadioButton(MainActivity.this); rButton.setText(course);
rgCourses.addView(rButton);
}
rgCourses.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() { @Override
public void onCheckedChanged(RadioGroup group, int checkedId) { int checkedRadioButtonId=rgCourses.getCheckedRadioButtonId();
RadioButton rButton=(RadioButton) findViewById(checkedRadioButtonId);







}
});
}
}
}
Snackbar.make(rgCourses,coursesMap.get(rButton.getText()),Snackbar.LENGTH_SHORT)
.show();

OUTPUT –




Practical 9
: Create an application with three buttons (with different colornames) verticallyaligned, on selecting a button color of the screen will change.


Code:
activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android" xmlns:app="http://schemas.android.com/apk/res-auto" xmlns:tools="http://schemas.android.com/tools" android:id="@+id/layoutSuperParent" android:layout_width="match_parent" android:layout_height="match_parent" tools:context=".MainActivity">

<LinearLayout android:layout_width="wrap_content" android:layout_height="wrap_content" android:orientation="vertical" app:layout_constraintBottom_toBottomOf="parent" app:layout_constraintLeft_toLeftOf="parent" app:layout_constraintRight_toRightOf="parent" app:layout_constraintTop_toTopOf="parent">

<Button android:layout_width="150dp" android:layout_height="wrap_content" android:id="@+id/btnRed"

android:layout_gravity="center" android:backgroundTint="@android:color/holo_red_dark" android:text="RED"/>
<Button android:layout_width="150dp" android:layout_height="wrap_content" android:id="@+id/btnBlue" android:layout_gravity="center" android:backgroundTint="@android:color/holo_blue_light" android:text="BLUE"/>
<Button android:layout_width="150dp" android:layout_height="wrap_content" android:id="@+id/btnGreen" android:gravity="center"
android:backgroundTint="@android:color/holo_green_dark" android:text="GREEN"/>
<Button android:layout_width="150dp" android:layout_height="wrap_content" android:id="@+id/btnReset" android:gravity="center" android:text="Reset"/>
</LinearLayout>


</androidx.constraintlayout.widget.ConstraintLayout>


MainActivity.java
package com.example.p9;

import androidx.appcompat.app.AppCompatActivity; import android.graphics.Color;
import android.view.View; import android.widget.Button;
import androidx.constraintlayout.widget.ConstraintLayout; import android.os.Bundle;

public class MainActivity extends AppCompatActivity implements View.OnClickListener { private Button btnRed;
private Button btnBlue; private Button btnGreen; private Button btnReset;
private ConstraintLayout layoutSuperParent; @Override
protected void onCreate(Bundle savedInstanceState) { super.onCreate(savedInstanceState); setContentView(R.layout.activity_main);
layoutSuperParent=(ConstraintLayout)findViewById(R.id.layoutSuperParent); btnRed=(Button)findViewById(R.id.btnRed); btnBlue=(Button)findViewById(R.id.btnBlue); btnGreen=(Button)findViewById(R.id.btnGreen); btnReset=(Button)findViewById(R.id.btnReset); btnRed.setOnClickListener(this);


btnBlue.setOnClickListener(this); btnGreen.setOnClickListener(this); btnReset.setOnClickListener(this);
}

@Override

public void onClick(View v){ switch (v.getId()){
case R.id.btnRed: layoutSuperParent.setBackgroundColor(Color.RED); break; case R.id.btnBlue: layoutSuperParent.setBackgroundColor(Color.BLUE); break; case R.id.btnGreen: layoutSuperParent.setBackgroundColor(Color.GREEN); break;
case R.id.btnReset: layoutSuperParent.setBackgroundColor(Color.TRANSPARENT); break; default:
break;

}
}
}

OUTPUT –




Practical 9
: Create an application with three buttons (with different colornames) horizontally aligned, on selecting a button color of the screen will change.


Code:
activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android" xmlns:app="http://schemas.android.com/apk/res-auto" xmlns:tools="http://schemas.android.com/tools" android:id="@+id/layoutSuperParent" android:layout_width="match_parent" android:layout_height="match_parent" tools:context=".MainActivity">

<LinearLayout android:layout_width="wrap_content" android:layout_height="wrap_content" android:orientation="horizontal" app:layout_constraintBottom_toBottomOf="parent" app:layout_constraintLeft_toLeftOf="parent" app:layout_constraintRight_toRightOf="parent" app:layout_constraintTop_toTopOf="parent">

<Button android:layout_width="75dp" android:layout_height="wrap_content" android:id="@+id/btnRed"

android:layout_gravity="center" android:backgroundTint="@android:color/holo_red_dark" android:text="RED"/>
<Button android:layout_width="75dp" android:layout_height="wrap_content" android:id="@+id/btnBlue" android:layout_gravity="center" android:backgroundTint="@android:color/holo_blue_light" android:text="BLUE"/>
<Button android:layout_width="75dp" android:layout_height="wrap_content" android:id="@+id/btnGreen" android:gravity="center"
android:backgroundTint="@android:color/holo_green_dark" android:text="GREEN"/>
<Button android:layout_width="75dp" android:layout_height="wrap_content" android:id="@+id/btnReset" android:gravity="center" android:text="Reset"/>
</LinearLayout>


</androidx.constraintlayout.widget.ConstraintLayout>


MainActivity.java
package com.example.p9;

import androidx.appcompat.app.AppCompatActivity; import android.graphics.Color;
import android.view.View; import android.widget.Button;
import androidx.constraintlayout.widget.ConstraintLayout; import android.os.Bundle;

public class MainActivity extends AppCompatActivity implements View.OnClickListener { private Button btnRed;
private Button btnBlue; private Button btnGreen; private Button btnReset;
private ConstraintLayout layoutSuperParent; @Override
protected void onCreate(Bundle savedInstanceState) { super.onCreate(savedInstanceState); setContentView(R.layout.activity_main);
layoutSuperParent=(ConstraintLayout)findViewById(R.id.layoutSuperParent); btnRed=(Button)findViewById(R.id.btnRed); btnBlue=(Button)findViewById(R.id.btnBlue); btnGreen=(Button)findViewById(R.id.btnGreen); btnReset=(Button)findViewById(R.id.btnReset); btnRed.setOnClickListener(this);


btnBlue.setOnClickListener(this); btnGreen.setOnClickListener(this); btnReset.setOnClickListener(this);
}

@Override

public void onClick(View v){ switch (v.getId()){
case R.id.btnRed: layoutSuperParent.setBackgroundColor(Color.RED); break; case R.id.btnBlue: layoutSuperParent.setBackgroundColor(Color.BLUE); break; case R.id.btnGreen: layoutSuperParent.setBackgroundColor(Color.GREEN); break;
case R.id.btnReset: layoutSuperParent.setBackgroundColor(Color.TRANSPARENT); break; default:
break;

}
}
}

OUTPUT –




Practical 10: Create a Login application (check username and password). Onsuccessful login, pop up the message. ("Welcome username")


Code:
activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android" xmlns:app="http://schemas.android.com/apk/res-auto" xmlns:tools="http://schemas.android.com/tools" android:layout_width="match_parent" android:layout_height="match_parent" tools:context=".MainActivity">

<EditText android:id="@+id/etEmail"
android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_marginTop="240dp" android:autofillHints="false" android:ems="10" android:hint="@string/e_mail_id" android:inputType="textEmailAddress"
app:layout_constraintBottom_toTopOf="@id/etPassword" app:layout_constraintEnd_toEndOf="parent" app:layout_constraintStart_toStartOf="parent" app:layout_constraintTop_toTopOf="parent" />


<EditText android:id="@+id/etPassword" android:layout_width="wrap_content"
android:layout_height="wrap_content" android:layout_marginTop="10dp" android:autofillHints="false" android:ems="10" android:hint="@string/password" android:inputType="textPassword"
app:layout_constraintBottom_toTopOf="@id/btnLogin" app:layout_constraintEnd_toEndOf="parent" app:layout_constraintStart_toStartOf="parent" app:layout_constraintTop_toBottomOf="@id/etEmail" />

<Button android:id="@+id/btnLogin"
android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_marginTop="30dp" android:text="@string/login" app:layout_constraintBottom_toTopOf="@id/btnRegister" app:layout_constraintEnd_toEndOf="parent" app:layout_constraintStart_toStartOf="parent" app:layout_constraintTop_toBottomOf="@id/etPassword" />

<Button

android:id="@+id/btnRegister" android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_marginBottom="250dp" android:text="@string/register" app:layout_constraintBottom_toBottomOf="parent" app:layout_constraintEnd_toEndOf="parent" app:layout_constraintStart_toStartOf="parent" app:layout_constraintTop_toBottomOf="@id/btnLogin" />

</androidx.constraintlayout.widget.ConstraintLayout>


MainActivity.java
package com.example.prac10;


import android.database.sqlite.SQLiteConstraintException; import android.os.Bundle;
import android.util.Log; import android.widget.Button;
import android.widget.EditText; import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;


import com.example.prac10.models.User;
import com.example.prac10.services.UserService;

public class MainActivity extends AppCompatActivity { private EditText etEmail;
private EditText etPassword; private Button btnLogin; private Button btnRegister; private UserService userService;

@Override
protected void onCreate(Bundle savedInstanceState) { super.onCreate(savedInstanceState); setContentView(R.layout.activity_main);

userService = UserService.getInstance(); UserService.initDatabase(this);

etEmail = (EditText) findViewById(R.id.etEmail); etPassword = (EditText) findViewById(R.id.etPassword); btnLogin = (Button) findViewById(R.id.btnLogin); btnRegister = (Button) findViewById(R.id.btnRegister);

btnLogin.setOnClickListener(v -> { User user = validateCredentials(); if (user != null) {
try {
userService.login(user);
Toast.makeText(this, "Welcome " + userService.getUser().email, Toast.LENGTH_SHORT).show();

} catch (IllegalStateException illegalStateException) {
Toast.makeText(this, "Invalid E-mail/Password", Toast.LENGTH_SHORT).show();
} catch (Exception e) { Log.d("TAG", e.getMessage());
Toast.makeText(this, "Error", Toast.LENGTH_SHORT).show();

}
}
});


btnRegister.setOnClickListener(v -> { User user = validateCredentials(); if (user != null) {
try {
userService.register(user);
Toast.makeText(this, "Registered", Toast.LENGTH_SHORT).show();
} catch (SQLiteConstraintException sqLiteConstraintException) { Toast.makeText(this, "E-mail Already Used", Toast.LENGTH_SHORT).show();
} catch (Exception e) {
Toast.makeText(this, "Error", Toast.LENGTH_SHORT).show();

}
}
});
}


private User validateCredentials() {
String email = etEmail.getText().toString().trim();
String password = etPassword.getText().toString().trim();


if (email.length() == 0) {
etEmail.setError("Enter your e-mail address"); return null;
}


if (password.length() == 0) { etPassword.setError("Enter your password"); return null;
}


return new User(email, password);
}
}

OUTPUT –



Practical 11: Create a login application as above, on successful login redirect to another activity with logout button. On click of logout button a dialog appears with OK and CANCEL button. On OK button clickgo to login activity and onCANCEL stay at same activity.


Code:
activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android" xmlns:app="http://schemas.android.com/apk/res-auto" xmlns:tools="http://schemas.android.com/tools" android:layout_width="match_parent" android:layout_height="match_parent" tools:context=".MainActivity">

<EditText
android:id="@+id/etEmail" android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_marginTop="240dp" android:autofillHints="false" android:ems="10" android:hint="@string/e_mail_id" android:inputType="textEmailAddress"
app:layout_constraintBottom_toTopOf="@id/etPassword" app:layout_constraintEnd_toEndOf="parent" app:layout_constraintStart_toStartOf="parent" app:layout_constraintTop_toTopOf="parent" />

<EditText android:id="@+id/etPassword" android:layout_width="wrap_content"
android:layout_height="wrap_content" android:layout_marginTop="10dp" android:autofillHints="false" android:ems="10"

android:hint="@string/password" android:inputType="textPassword" app:layout_constraintBottom_toTopOf="@id/btnLogin" app:layout_constraintEnd_toEndOf="parent" app:layout_constraintStart_toStartOf="parent" app:layout_constraintTop_toBottomOf="@id/etEmail" />

<Button
android:id="@+id/btnLogin" android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_marginTop="30dp" android:text="@string/login" app:layout_constraintBottom_toTopOf="@id/btnRegister" app:layout_constraintEnd_toEndOf="parent" app:layout_constraintStart_toStartOf="parent" app:layout_constraintTop_toBottomOf="@id/etPassword" />

<Button
android:id="@+id/btnRegister" android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_marginBottom="250dp" android:text="@string/register" app:layout_constraintBottom_toBottomOf="parent" app:layout_constraintEnd_toEndOf="parent" app:layout_constraintStart_toStartOf="parent" app:layout_constraintTop_toBottomOf="@id/btnLogin" />

</androidx.constraintlayout.widget.ConstraintLayout>


Activity_member_module.xml


<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android" xmlns:app="http://schemas.android.com/apk/res-auto" xmlns:tools="http://schemas.android.com/tools"

android:layout_width="match_parent" android:layout_height="match_parent" tools:context=".MemberModule">

<TextView android:id="@+id/tvWelcome" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="@string/welcome"
android:textAppearance="@style/TextAppearance.AppCompat.Display1" app:layout_constraintBottom_toTopOf="@id/tvEmail" app:layout_constraintEnd_toEndOf="parent" app:layout_constraintStart_toStartOf="parent" app:layout_constraintTop_toTopOf="parent" />

<TextView android:id="@+id/tvEmail"
android:layout_width="wrap_content" android:layout_height="wrap_content" android:text=""
app:layout_constraintBottom_toTopOf="@id/btnLogout" app:layout_constraintEnd_toEndOf="parent" app:layout_constraintStart_toStartOf="parent" app:layout_constraintTop_toBottomOf="@id/tvWelcome" />

<Button android:id="@+id/btnLogout"
android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="@string/log_out" app:layout_constraintBottom_toBottomOf="parent" app:layout_constraintEnd_toEndOf="parent" app:layout_constraintStart_toStartOf="parent" app:layout_constraintTop_toBottomOf="@+id/tvEmail" />

</androidx.constraintlayout.widget.ConstraintLayout>


MainActivity.java
package com.example.prac11;

import android.content.Intent;
import android.database.sqlite.SQLiteConstraintException;

import android.os.Bundle; import android.util.Log; import android.widget.Button;
import android.widget.EditText; import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity; import com.example.prac11.models.User;
import com.example.prac11.services.UserService;

public class MainActivity extends AppCompatActivity {
private EditText etEmail; private EditText etPassword; private Button btnLogin; private Button btnRegister; private UserService userService;

@Override
protected void onCreate(Bundle savedInstanceState) { super.onCreate(savedInstanceState); setContentView(R.layout.activity_main);

userService = UserService.getInstance(); UserService.initDatabase(this);

etEmail = (EditText) findViewById(R.id.etEmail); etPassword = (EditText) findViewById(R.id.etPassword); btnLogin = (Button) findViewById(R.id.btnLogin); btnRegister = (Button) findViewById(R.id.btnRegister);

btnLogin.setOnClickListener(v -> { User user = validateCredentials(); if (user != null) {
try {
userService.login(user);
Toast.makeText(this, "Logged In", Toast.LENGTH_SHORT).show(); startActivity(new Intent(this, MemberModule.class));
} catch (IllegalStateException illegalStateException) {
Toast.makeText(this, "Invalid E-mail/Password", Toast.LENGTH_SHORT).show();
} catch (Exception e) {

Log.d("TAG", e.getMessage());
Toast.makeText(this, "Error", Toast.LENGTH_SHORT).show();
}
}
});

btnRegister.setOnClickListener(v -> { User user = validateCredentials(); if (user != null) {
try {
userService.register(user);
Toast.makeText(this, "Registered", Toast.LENGTH_SHORT).show(); startActivity(new Intent(this, MemberModule.class));
} catch (SQLiteConstraintException sqLiteConstraintException) { Toast.makeText(this, "E-mail Already Used", Toast.LENGTH_SHORT).show();
} catch (Exception e) {
Toast.makeText(this, "Error", Toast.LENGTH_SHORT).show();
}
}
});
}

private User validateCredentials() {
String email = etEmail.getText().toString().trim();
String password = etPassword.getText().toString().trim();

if (email.length() == 0) {
etEmail.setError("Enter your e-mail address");
return null;
}

if (password.length() == 0) { etPassword.setError("Enter your password"); return null;
}

return new User(email, password);
}
}

MemberModule.java
package com.example.prac11;

import android.app.AlertDialog; import android.os.Bundle; import android.widget.TextView; import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity; import com.example.prac11.models.User;
import com.example.prac11.services.UserService;

public class MemberModule extends AppCompatActivity {
private User user;
private UserService userService; private TextView tvEmail; private TextView btnLogout;

@Override
protected void onCreate(Bundle savedInstanceState) { super.onCreate(savedInstanceState); setContentView(R.layout.activity_member_module);

userService = UserService.getInstance(); user = userService.getUser();

tvEmail = (TextView) findViewById(R.id.tvEmail); btnLogout = (TextView) findViewById(R.id.btnLogout);

if (user == null) {
super.finish();
} else {
tvEmail.setText(user.email);
}

btnLogout.setOnClickListener(v -> {
new AlertDialog.Builder(this)
.setTitle("Logout")
.setMessage("Are you sure you want to log out?")





});
}
.setPositiveButton(android.R.string.ok, (dialog, which) -> logoutUser())
.setNegativeButton(android.R.string.cancel, null)
.setIcon(android.R.drawable.ic_dialog_alert)
.show();

private void logoutUser() { userService.logout();
Toast.makeText(this, "Logged Out", Toast.LENGTH_SHORT).show();
super.finish();
}
}

OUTPUT –




	





Practical 12: Create an application to Create, Insert, update andDelete operation on the database.


Code:
activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android" xmlns:app="http://schemas.android.com/apk/res-auto" xmlns:tools="http://schemas.android.com/tools" android:id="@+id/clRoot" android:layout_width="match_parent"

android:layout_height="match_parent" tools:context=".MainActivity">

<androidx.swiperefreshlayout.widget.SwipeRefreshLayout android:layout_width="match_parent" android:layout_height="match_parent" android:id="@+id/swipeLayout" app:layout_constraintBottom_toBottomOf="parent" app:layout_constraintLeft_toLeftOf="parent" app:layout_constraintRight_toRightOf="parent" app:layout_constraintTop_toTopOf="parent">

<androidx.recyclerview.widget.RecyclerView android:id="@+id/rvTodos" android:layout_width="wrap_content" android:layout_height="wrap_content" />
</androidx.swiperefreshlayout.widget.SwipeRefreshLayout>


<com.google.android.material.floatingactionbutton.FloatingActionButton android:id="@+id/fabAdd"
android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_gravity="end|bottom" android:layout_margin="16dp" android:src="@drawable/ic_add" app:layout_constraintBottom_toBottomOf="parent" app:layout_constraintEnd_toEndOf="parent" />


</androidx.constraintlayout.widget.ConstraintLayout>


Todo_item.xml
<?xml version="1.0" encoding="utf-8"?>
<com.google.android.material.card.MaterialCardView xmlns:android="http://schemas.android.com/apk/res/android" xmlns:app="http://schemas.android.com/apk/res-auto" android:id="@+id/cvParent" android:layout_width="match_parent" android:layout_height="wrap_content" android:layout_marginHorizontal="@dimen/card_margin" android:layout_marginTop="@dimen/card_margin" app:cardCornerRadius="@dimen/cardview_default_radius" app:cardElevation="@dimen/cardview_default_elevation">

<RelativeLayout android:layout_width="match_parent" android:layout_height="wrap_content"
android:layout_margin="@dimen/default_card_content_margin">


<TextView android:id="@+id/tvTodoId"
android:layout_width="wrap_content" android:layout_height="wrap_content" android:visibility="invisible" />

<TextView android:id="@+id/tvTodoContent"
style="@style/TextAppearance.MaterialComponents.Headline6" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="@string/default_todo_content" />

<TextView android:id="@+id/tvTodoAddedAt" android:layout_width="match_parent" android:layout_height="wrap_content"
android:layout_below="@id/tvTodoContent" android:layout_marginVertical="5dp" android:text="@string/default_todo_added_at" />

<LinearLayout android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_below="@id/tvTodoAddedAt" android:orientation="horizontal">

<Button android:id="@+id/btnTodoAction"
style="@style/Widget.MaterialComponents.Button.OutlinedButton" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="@string/default_todo_action" />


<Button android:id="@+id/btnTodoDelete"
style="@style/Widget.MaterialComponents.Button.OutlinedButton" android:textColor="@android:color/holo_red_dark" android:layout_marginStart="10dp" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="@string/default_todo_delete" />
</LinearLayout>
</RelativeLayout>
</com.google.android.material.card.MaterialCardView>


Dialog_layout.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android" android:orientation="vertical"
android:paddingHorizontal="20dp" android:layout_width="match_parent" android:layout_height="match_parent">
<EditText android:id="@+id/etNewContent" android:inputType="text" android:layout_width="match_parent" android:layout_height="wrap_content" android:hint="Content" />
</LinearLayout>


MainActivity.java
package com.example.prac12;

import android.app.AlertDialog; import android.os.Bundle;
import android.view.LayoutInflater; import android.view.View;
import android.widget.EditText; import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity; import androidx.recyclerview.widget.LinearLayoutManager; import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;
import com.google.android.material.floatingactionbutton.FloatingActionButton; import com.example.prac12.adapters.RVAdapter;
import com.example.prac12.repos.TodoRepository;

public class MainActivity extends AppCompatActivity implements  
SwipeRefreshLayout.OnRefreshListener { private TodoRepository todoRepository; private RecyclerView rvTodos;
private RVAdapter todosAdapter;
private SwipeRefreshLayout swipeLayout;


@Override
protected void onCreate(Bundle savedInstanceState) { super.onCreate(savedInstanceState); setContentView(R.layout.activity_main);

todoRepository = new TodoRepository(this); todosAdapter = new RVAdapter(this, todoRepository);
swipeLayout = (SwipeRefreshLayout) findViewById(R.id.swipeLayout);

swipeLayout.setOnRefreshListener(this);

rvTodos = (RecyclerView) findViewById(R.id.rvTodos); rvTodos.setAdapter(todosAdapter); rvTodos.setLayoutManager(new LinearLayoutManager(this));

FloatingActionButton fabAdd = (FloatingActionButton) findViewById(R.id.fabAdd); fabAdd.setOnClickListener(v -> {
View layout = getLayoutInflater().inflate(R.layout.dialog_layout, null); EditText etNewContent = (EditText) layout.findViewById(R.id.etNewContent); AlertDialog dialog = new AlertDialog.Builder(this)
.setView(layout)
.setTitle("Add New Todo")
.setPositiveButton("Save", (_dialog, which) -> {
String content = etNewContent.getText().toString().trim();
if (content.length() == 0) {
Toast.makeText(this, "No Text Entered", Toast.LENGTH_SHORT).show();
} else {
todoRepository.create(content); loadTodos();
}
})




});
.setNegativeButton("Cancel", (_dialog, which) -> _dialog.dismiss())
.create(); dialog.show();


loadTodos();
}

@Override
public void onRefresh() { loadTodos();
}

private void loadTodos() { swipeLayout.setRefreshing(true); todosAdapter.setTodos(todoRepository.getAll()); swipeLayout.setRefreshing(false);
}
}
