package com.testme.wtcodechallenge.api.model

import com.google.gson.annotations.SerializedName

/**
 * Created by Pablo Reyes [devpab@gmail.com] on 1/11/21.
 */
data class Ebook(
    val title: String?,
    val author: String?,

    @SerializedName("imageURL")
    val image: String?
)