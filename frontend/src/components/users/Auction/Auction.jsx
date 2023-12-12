import React, { useEffect } from 'react'
import { DataView, DataViewLayoutOptions } from 'primereact/dataview';
import axios from 'axios';
import { useState } from 'react';
import { Card } from 'primereact/card';
import { Image } from 'primereact/image';
        
function Auction() {

    const [ProductData, setProductData] = useState([]);
    const [loading, setloading] = useState(true)


    useEffect(() => {
        axios.get(`/api/AllItems`).then(res => {
            if(res.data.status === 200){
                setProductData(res.data.results)
            }
            setloading(false)
        }).catch((error) => {
            if(error.response.status === 500){

            }
        })
    },[]);


    const itemTemplate = (ProductData) => {
        return (
            <div className="container-fluid">
                <div className="row">
                    <div className="col-lg-12 mb-3">
                        <Image className='me-2' preview src={`http://127.0.0.1:8000/${ProductData.image}`} width='200' height='150' />
                        <span>{ProductData.product_name}</span>
                        
                    </div>
                </div>
            </div>
        )
    }
    return (
        <div className='container-fluid'>
            <Card title="Auction Product">
                <DataView value={ProductData}  loading={loading} itemTemplate={itemTemplate} paginator paginatorPosition='both' paginatorLeft  rows={5} />
            </Card>
        </div>
    )
}

export default Auction