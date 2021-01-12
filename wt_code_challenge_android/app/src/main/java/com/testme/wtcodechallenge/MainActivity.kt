package com.testme.wtcodechallenge

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.RecyclerView
import com.testme.wtcodechallenge.adapter.EbooksAdapter
import com.testme.wtcodechallenge.api.Api
import com.testme.wtcodechallenge.api.model.Ebook
import okhttp3.OkHttpClient
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

class MainActivity : AppCompatActivity() {

    /**
     * this should be in a separate module and in its own file
     */
    private val api: Api by lazy {
        Retrofit.Builder()
            .baseUrl("http://de-coding-test.s3.amazonaws.com")
            .client(OkHttpClient.Builder().build())
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(Api::class.java)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val recyclerView = findViewById<RecyclerView>(R.id.eBooksList)

        /**
         * We are doing all the stuff here, but i prefer to use MVVM and handle all inside VM
         * and send dat to the View using LiveData
         */
        api.getEbooks().enqueue(object: Callback<List<Ebook>> {
            override fun onResponse(call: Call<List<Ebook>>, response: Response<List<Ebook>>) {
                if (response.isSuccessful) {
                    recyclerView.adapter = EbooksAdapter(response.body() ?: emptyList())
                } else {
                    Toast.makeText(this@MainActivity, R.string.something_went_wrong, Toast.LENGTH_LONG).show()
                }
            }

            override fun onFailure(call: Call<List<Ebook>>, t: Throwable) {
                Toast.makeText(this@MainActivity, R.string.something_went_wrong, Toast.LENGTH_LONG).show()
            }
        })
    }
}