package com.testme.wtcodechallenge.adapter

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.testme.wtcodechallenge.R
import com.testme.wtcodechallenge.api.model.Ebook

/**
 * Created by Pablo Reyes [devpab@gmail.com] on 1/11/21.
 */
class EbooksAdapter(private val items: List<Ebook>) :
    RecyclerView.Adapter<EbooksAdapter.EbooksViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): EbooksViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.list_item_ebook_row, parent, false)
        return EbooksViewHolder(view)
    }

    override fun onBindViewHolder(holder: EbooksViewHolder, position: Int) {
        holder.bind(items[position])
    }

    override fun getItemCount(): Int = items.size

    class EbooksViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {

        fun bind(ebook: Ebook) {
            val title = itemView.findViewById<TextView>(R.id.title)
            val author = itemView.findViewById<TextView>(R.id.author)
            val cover = itemView.findViewById<ImageView>(R.id.cover)

            title.text = ebook.title
            author.text = ebook.author

            ebook.image?.let { Glide.with(itemView).load(it).into(cover) }
        }
    }
}