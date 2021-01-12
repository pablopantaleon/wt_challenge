package com.testme.wtcodechallenge.api

import com.testme.wtcodechallenge.api.model.Ebook
import retrofit2.Call
import retrofit2.http.GET

/**
 * Created by Pablo Reyes [devpab@gmail.com] on 1/11/21.
 */
interface Api {

    @GET("/books.json")
    fun getEbooks() : Call<List<Ebook>>
}