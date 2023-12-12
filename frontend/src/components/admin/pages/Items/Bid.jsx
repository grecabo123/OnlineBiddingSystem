import axios from 'axios';
import { Button } from 'primereact/button';
import moment from 'moment';
import { Badge } from 'primereact/badge';
import { Card } from 'primereact/card'
import { Skeleton } from 'primereact/skeleton';
import React, { useEffect, useState } from 'react'
import {FcFolder} from 'react-icons/fc'
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import { Tag } from 'primereact/tag';
import { PrimeIcons } from 'primereact/api';
import { Link } from 'react-router-dom/cjs/react-router-dom.min';

function Bid() {
    
    const [loading, setloading] = useState(true);
    const [tbldata, settbldata] = useState([]);

    useEffect(() => {
        axios.get(`/api/AllItems`).then(res => {
            if(res.data.status === 200) {
                settbldata(res.data.results);
            }
            else{

            }
            setloading(false)
        }).catch((error) => {

        })
    },[]);
    
    const PriceUnit = (tbldata) => {
        return (
            <>
            {
                tbldata.quantity_product === 1 ? <Tag className='p-tag' severity={'info'} value="Per Kilo" /> : <Tag className='p-tag' value="Per Pieces" />
            }
            </>
        )
    }
    const PriceFormat = (tbldata) => {
        return(
            <>
                ₱{tbldata.product_price.toFixed(2)}
            </>
        )
    }
    const StatusProduct = (tbldata) => {
        return(
            <>
                {tbldata.price_status === 0  ? <Tag severity={'info'} value="Selling" /> : <Tag severity={'success'} value="Sold" />}
            </>
        )
    }

    const Actions_btn = (tbldata) => {
        return (
            <>
                <div className="me-2">
                   <Link to={`/admin/product/refid=${tbldata.id}`}> <Button  className='p-button-sm p-button-info me-2 mb-1' label='Details' icon={PrimeIcons.EYE} /></Link>
                    <Button onClick={RemoveItem} value={tbldata.id} className='p-button-sm p-button-danger mb-1' label='Remove' icon={PrimeIcons.TRASH}  />
                </div>
            </>
        )
    }

    const ProductItem = (tbldata) => {
        return (
            <>
                <FcFolder size={25} className='align-middle' /> <span className='align-middle fs-6'>{tbldata.product_name}</span>
            </>
        )
    }

    const RemoveItem = (e) => {
        
    }


    return (
        <div className='container-fluid'>
            <Card title="Bid Items">
                <DataTable value={tbldata} sortMode='multiple' paginator paginatorLeft loading={loading} rows={10}>
                    <Column field='product_name' sortable body={ProductItem} header="Product Name"></Column>
                    <Column field='product_price' sortable body={PriceFormat} header="Product Price"></Column>
                    <Column field='quantity_product' sortable body={PriceUnit} header="Price Unit"></Column>
                    <Column field='price_status' sortable body={StatusProduct} header="Product Status"></Column>
                    <Column field='uniq_key' sortable body={Actions_btn} header="Actions"></Column>
                </DataTable>
            </Card>
        </div>
    )
}

export default Bid