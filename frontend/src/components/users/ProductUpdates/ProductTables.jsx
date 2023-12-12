import axios from 'axios'
import { Button } from 'primereact/button';
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable'
import { Toast } from 'primereact/toast';
import React, { useEffect, useRef, useState } from 'react'

function ProductTables() {

    const [Product, setProduct] = useState([]);
    const toast = useRef();

    useEffect(() => {
        UpdateProduct();
    },[])

    const UpdateProduct = () => {
        axios.get(`/api/GetProductUpdate`).then(res => {
            if(res.data.status === 200) {
                setProduct(res.data.data)
            }
        }).catch((error) => {
            if(error.response.status === 500){

            }
        })
    }
    const GetData = () => {
        UpdateProduct();
        toast.current.show({severity: "success", summary: "Fetch Data", detail: "Successfully"})
    }

    const header = <div className='d-flex justify-content-between align-items-center'>
        <span>Product Price</span>
        <Button className='p-button-sm p-button-info' onClick={GetData} label='Refresh' />
    </div>  

    const PriceFormat = (Product) => {
        return (
            <>
                <span>₱{Product.product_price.toFixed(2)}</span>
            </>
        )
    }
    return (
        <div>
            <Toast ref={toast} />
            <DataTable header={header}value={Product} paginator paginatorLeft rows={10}>
                <Column field='product_name' header="Product Name"></Column>
                <Column field='product_price' body={PriceFormat} header="Product Price "></Column>
            </DataTable>
        </div>
    )
}

export default ProductTables